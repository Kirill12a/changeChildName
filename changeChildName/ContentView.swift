//
//  ContentView.swift
//  changeChildName
//
//  Created by Kirill Drozdov on 31.08.2021.
//

import SwiftUI
//Начало
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
                    NavigationLink(
                        
                        destination: WoomanView(),
                        label: {
                            
                            Image(uiImage:#imageLiteral(resourceName: "girl"))
                                .offset(x: offset.width, y: offset.height - 100)
                            
                        })
                    
                    
                    
                    
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
