//
//  ManView.swift
//  changeChildName
//
//  Created by Kirill Drozdov on 31.08.2021.
//

import SwiftUI

struct ManView: View {
    var body: some View {
        NavigationView{
        ZStack{
            LinearGradient(gradient: Gradient(colors: [Color.red, Color.purple, Color.white, Color.orange]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            HStack{
                NavigationLink(
                    destination: Text("Destination"),
                    label: {
                        Image(uiImage: #imageLiteral(resourceName: "european-union-3"))
                    })
                    .offset(x: -63, y: -160)
            }
            HStack{
                NavigationLink(
                    destination: Text("Destination"),
                    label: {
                        Image(uiImage: #imageLiteral(resourceName: "kaaba"))
                        
                    })
                    .offset(x: 68, y: -160)
            
            }
            
            HStack{
                
                NavigationLink(
                    destination: Text("Destination"),
                    label: {
                        Image(uiImage: #imageLiteral(resourceName: "russia"))
                    })
             
                
                NavigationLink(
                    destination: Text("Destination"),
                    label: {
Image(uiImage: #imageLiteral(resourceName: "united-states"))
                        
                    })
                
            }
            .padding(20)
           
        
        Spacer()
        
        
        //            .navigationBarBackButtonHidden(true) - это чтобы не было кнопки назад
 
        }
    }
    }
}

struct ManView_Previews: PreviewProvider {
    static var previews: some View {
        ManView()
    }
}
