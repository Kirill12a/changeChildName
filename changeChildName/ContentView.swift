

import SwiftUI
struct ContentView: View {
    @State private var offset: CGSize = .zero
    var body: some View {
        NavigationView{
            ZStack{
                //MARK: Градиент экрана / Gradient view
                LinearGradient(gradient: Gradient(colors: [Color.red, Color.purple, Color.white, Color.orange]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .ignoresSafeArea()
                ///__(|||||)__///
                VStack{
                    Spacer()
                    NavigationLink(
                        destination: WoomanView(),
                        label: {
                            Image(uiImage:#imageLiteral(resourceName: "girl"))
                                .offset(x: offset.width, y: offset.height - 100)
                        })
                    Spacer()
                    
                    NavigationLink(
                        destination: ManView(),
                        label: {
                            Image(uiImage: #imageLiteral(resourceName: "boy"))
                                .offset(x: offset.width, y: offset.height + 14)
                            
                        })
                }
                Spacer()
  
            }
            
        }
    }
    
}

















struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
