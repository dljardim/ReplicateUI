//
//  Tabs.swift
//  ReplicateUI
//
//  Created by Damian Jardim on 5/5/25.
//

/*
 
 10 exercises to learn tab view
 
 */

import SwiftUI

// Tab bar connected to the bottom of the screen
struct TabViewTrials: View {
    var body: some View {
        TabView {
            Tab("Received", systemImage: "tray.and.arrow.down.fill"){
                NavigationStack{
                    RecievedView()
                }
            }.badge(2)
            
            Tab("Sent", systemImage: "tray.and.arrow.up.fill"){
                NavigationStack{
                    SentView()
                }
            }.badge(2)
            
            Tab("Account", systemImage: "person.crop.circle.fill"){
                NavigationStack{
                    AccountView()
                }
            }.badge(2)
        }
        
    }
}


struct CustomTabView: View {
    @State private var selectedTab: Int = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            Text("Welcome to Home")
                .tag(0)
            
            Text("This is your Profile")
                .tag(1)
            
            Text("Settings go here")
                .tag(2)
        }
        .tabViewStyle(.page(indexDisplayMode: .never)) // Hide default tab bar
        
        .overlay(alignment: .bottom) {
            HStack {
                tabButton(index: 0, systemIcon: "house.fill", label: "Home")
                tabButton(index: 1, systemIcon: "person.fill", label: "Profile")
                tabButton(index: 2, systemIcon: "gearshape.fill", label: "Settings")
            }
            .padding()
            .background(.ultraThinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .padding(.horizontal)
        }
        
        Spacer()
        
  
    }
    
    private func tabButton(index: Int, systemIcon: String, label: String) -> some View {
        Button(action: {
            selectedTab = index
        }) {
            VStack {
                Image(systemName: systemIcon)
                Text(label)
                    .font(.caption)
            }
            .foregroundColor(selectedTab == index ? .blue : .gray)
        }
        .frame(maxWidth: .infinity)
    }
}


struct RecievedView: View{
    var body: some View {
        Text("RecievedView")
    }
}

struct SentView: View{
    var body: some View {
        Text("SentView")
    }
}

struct AccountView: View{
    var body: some View {
        Text("AccountView")
    }
}



#Preview {
//    TabViewTrials().preferredColorScheme(.dark)
    CustomTabView().preferredColorScheme(.dark)
}
