//
//  UserListView.swift
//  ReplicateUI
//
//  Created by Damian Jardim on 4/29/25.
//

import SwiftUI

struct UserListView: View {
    @EnvironmentObject private var userStore: UserStore
    
    var body: some View {
        List(userStore.users) { user in
            NavigationLink(value: user) {
                Text(user.name)
            }
        }
        .navigationTitle("Users")
    }
}
