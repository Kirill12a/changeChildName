

import SwiftUI
 
struct CardView: View {
     
    @State private var translation: CGSize = .zero
    @State private var swipeStatus: LikeDislike = .none
    
    @State private var arrayLikeName = [String]()
    @State private var arrayReSaveName = [String]()
     
    private var user: User
    private var onRemove: (_ user: User) -> Void
     
    private var thresholdPercentage: CGFloat = 0.5 // when the user has draged 50% the width of the screen in either direction
     
    private enum LikeDislike: Int {
        case like, dislike, none
    }
     
    init(user: User, onRemove: @escaping (_ user: User) -> Void) {
        self.user = user
        self.onRemove = onRemove
    }
     
    /// What percentage of our own width have we swipped - Parameters: - geometry: The geometry - gesture: The current gesture translation value
    private func getGesturePercentage(_ geometry: GeometryProxy, from gesture: DragGesture.Value) -> CGFloat {
        gesture.translation.width / geometry.size.width
    }
     
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .leading) {
                 ZStack(alignment: self.swipeStatus == .like ? .topLeading : .topTrailing) {
                    Image(self.user.imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: geometry.size.width, height: geometry.size.height * 0.75)
                        .clipped()
                     
                    if self.swipeStatus == .like {
                        Text("LIKE")
                            .font(.headline)
                            .padding()
                            .cornerRadius(10)
                            .foregroundColor(Color.green)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.green, lineWidth: 3.0)
                        ).padding(24)
                            .rotationEffect(Angle.degrees(-45))
                        
                    } else if self.swipeStatus == .dislike {
                        Text("DISLIKE")
                            .font(.headline)
                            .padding()
                            .cornerRadius(10)
                            .foregroundColor(Color.red)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.red, lineWidth: 3.0)
                        ).padding(.top, 45)
                            .rotationEffect(Angle.degrees(45))
                    }
                }
                 
                HStack {
                    VStack(alignment: .center, spacing: 0) {
                        Text("\(self.user.firstName)")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .frame(width:300, height: 50, alignment: .center)
                            .multilineTextAlignment(.center)
                            
                      
                      
                    }
                    Spacer()
                     
                   
                }
                .padding(.horizontal)
            }
            .padding(.bottom)
            .background(Color.white)
            .cornerRadius(10)
            .shadow(radius: 5)
            .animation(.interactiveSpring())
            .offset(x: self.translation.width, y: 0)
            .rotationEffect(.degrees(Double(self.translation.width / geometry.size.width) * 25), anchor: .bottom)
            .gesture(
                DragGesture()
                    .onChanged { value in
                        self.translation = value.translation
                         
                        if (self.getGesturePercentage(geometry, from: value)) >= self.thresholdPercentage {
                            self.swipeStatus = .like
                            var valueName = self.user.firstName
                            arrayLikeName.append(valueName)
//                            arrayLikeName.append(contentsOf: [user.firstName])
//                            arrayLikeName.insert(contentsOf: [self.user.firstName], at: 0)
                            
//                            print("\(self.user.firstName)")
                            print("\(arrayLikeName)")
                           
                        } else if self.getGesturePercentage(geometry, from: value) <= -self.thresholdPercentage {
                            self.swipeStatus = .dislike
                            
                        } else {
                            self.swipeStatus = .none
                        }
                         
                }.onEnded { value in
                    // determine snap distance > 0.5 aka half the width of the screen
                        if abs(self.getGesturePercentage(geometry, from: value)) > self.thresholdPercentage {
                            self.onRemove(self.user)
                        } else {
                            self.translation = .zero
                        }
                    }
            )
        }
    }
}
 
struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(user: User(id: 1, firstName: "Cairocoders", imageName: "photo1"),
                 onRemove: { _ in
                    // do nothing
            })
            .frame(height: 400)
            .padding()
    }
}

