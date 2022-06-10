//
//  ContentView.swift
//  iOSAppTemplate
//
//  Created by Linder Anderson Hassinger Solano    on 5/06/22.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        VStack{
            CardView()
            HStack{
                HomeButtonView(imageName: "dislike-button_1")
                HomeButtonView(imageName: "flash-button")
                HomeButtonView(imageName: "like-button")
                HomeButtonView(imageName: "super-like-button")
                HomeButtonView(imageName: "undo-button")
            }.padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
