//
//  RussinanNameM.swift
//  changeChildName
//
//  Created by Kirill Drozdov on 03.09.2021.
//

import SwiftUI



struct User: Hashable, CustomStringConvertible {
    var id: Int
     
    var firstName: String
  
   
   
    let imageName: String
    
     
    var description: String {
        return "\(firstName), id: \(id)"
    }
}

struct RussinanNameM: View {
    /// List of users
    @State var users: [User] = [
        User(id: 0, firstName: "Airi", imageName: "boy"),
        User(id: 1, firstName: "Angeleca", imageName: "boy"),
        User(id: 2, firstName: "Aston", imageName: "boy"),
        User(id: 3, firstName: "Bradley", imageName: "boy"),
        User(id: 4, firstName: "Bruno", imageName: "boy"),
        User(id: 5, firstName: "Cara", imageName: "boy")
    ]
     
    /// Return the CardViews width for the given offset in the array
    /// - parameters: - geometry: The geometry proxy of the parent, - id: The ID of the current user
    private func getCardWidth(_ geometry: GeometryProxy, id: Int) -> CGFloat {
        let offset: CGFloat = CGFloat(users.count - 1 - id) * 10
        return geometry.size.width - offset // это отвечает за нахождение блока карточек, типо они будут друг под другом или будут под откос в лево
    }
     
    /// Return the CardViews frame offset for the given offset in the array
    /// - Parameters: - geometry: The geometry proxy of the parent, - id: The ID of the current user
    private func getCardOffset(_ geometry: GeometryProxy, id: Int) -> CGFloat {
        return  CGFloat(users.count - 24 - id) * 10 // можно менять расположение картинок на экарне, если поменять 8 на что то другое
    }
     
    private var maxID: Int {
        return self.users.map { $0.id }.max() ?? 0
    }
     
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [Color.red, Color.purple, Color.white, Color.orange]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
        VStack {
            GeometryReader { geometry in
              
                VStack(spacing: 24) {
                    Spacer(minLength: 80)
                    ZStack {
                        ForEach(self.users, id: \.self) { user in
                            // Range Operator
                            if (self.maxID - 3)...self.maxID ~= user.id {
                                CardView(user: user, onRemove: { removedUser in
                                    // Remove that user from our array
                                    self.users.removeAll { $0.id == removedUser.id }
                                })
                                    .frame(width: self.getCardWidth(geometry, id: user.id), height: 400)
                                    .offset(x: 0, y: self.getCardOffset(geometry, id: user.id))
                            }
                        }
                    }
                    Spacer()
                }.navigationBarBackButtonHidden(true)
            }
        }.padding()
        }
        
    }
}

struct RussinanNameM_Previews: PreviewProvider {
    static var previews: some View {
        RussinanNameM()
    }
}
