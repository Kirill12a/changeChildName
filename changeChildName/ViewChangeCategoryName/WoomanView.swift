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
        Text("Wooman")
    }
    }
    
}

struct WoomanView_Previews: PreviewProvider {
    static var previews: some View {
        WoomanView()
    }
}
