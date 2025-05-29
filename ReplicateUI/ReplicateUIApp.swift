//
//  ReplicateUIApp.swift
//  ReplicateUI
//
//  Created by Damian Jardim on 4/22/25.
//

import SwiftUI

@main
struct ReplicateUIApp: App {
    
    @StateObject private var userStore = UserStore(users: [
        User(name: "Joe Biden"),
        User(name: "Barack O'bama"),
        User(name: "Donald Trump")
    ])
    
    var body: some Scene {
        WindowGroup {
//            ContentView()
//                .environmentObject(userStore)
            VitalsFormView()
        }
    }
}
