//
//  WoomanView.swift
//  changeChildName
//
//  Created by Kirill Drozdov on 02.09.2021.
//

import SwiftUI

struct WoomanView: View {
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [Color.red, Color.purple, Color.white, Color.orange]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            HStack{
                NavigationLink(
                    destination: EuropeanNameW(),
                    label: {
                        Image(uiImage: #imageLiteral(resourceName: "european-union-3"))
                    })
                    .offset(x: -63, y: -160)
            }
            HStack{
                NavigationLink(
                    destination: MuslimNameW(),
                    label: {
                        Image(uiImage: #imageLiteral(resourceName: "kaaba"))
                        
                    })
                    .offset(x: 68, y: -160)
            
            }
            
            HStack{
                
                NavigationLink(
                    destination: RussinanNameW(),
                    label: {
                        Image(uiImage: #imageLiteral(resourceName: "russia"))
                    })
             
                
                NavigationLink(
                    destination:USANameW(),
                    label: {
Image(uiImage: #imageLiteral(resourceName: "united-states"))
                        
                    })
                
            }
            .padding(20)
           
        
        Spacer()
        
        
           .navigationBarBackButtonHidden(true) 
 
        }
    }
    
}

struct WoomanView_Previews: PreviewProvider {
    static var previews: some View {
        WoomanView()
    }
}
