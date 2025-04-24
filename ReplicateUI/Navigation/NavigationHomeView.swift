//
//  NavigationHome.swift
//  ReplicateUI
//
//  Created by Damian Jardim on 4/22/25.
//

import SwiftUI

struct NavigationHomeView: View {
    var body: some View {
        Text("NavigationHomeView")
        
        // tap a button or image to go to the next scene
        
        // slide up a treasure box from the bottom
        
        // show a fairy hint as a little popup card
        
        // return to the main map
        
        NavigationStack{
            NavigationLink("Go to the castle", destination: CastleView())
        }
        
        // full screen modal view .fullScreenCover
        
        // slide up sheet .sheet\
        
        // custom buttons - Button {show = true}
        
        // overlays
        
        // popups
        
        // use state variables to control the view presentation
        
        // @Binding
        
        // @ObservedObject
        
        // @EnvironmentObject
    }
}

struct CastleView: View {
    var body: some View {
        Text("CastleView")
    }
}

#Preview {
    NavigationHomeView()
}



