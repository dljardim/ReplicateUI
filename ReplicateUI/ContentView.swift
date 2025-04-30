//
//  ContentView.swift
//  ReplicateUI
//
//  Created by Damian Jardim on 4/22/25.
//

import SwiftUI
// TODO: move this into the UserManager file
struct ContentView: View {
    @EnvironmentObject private var userStore: UserStore
    @State private var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path){
            UserListView()
                .navigationDestination(for: User.self){ user in
                    UserDetailView(user:user)
                }
        }
        
    }

}
    

