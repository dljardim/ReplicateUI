//
//  UserDetailView.swift
//  ReplicateUI
//
//  Created by Damian Jardim on 4/29/25.
//

import SwiftUI

struct UserDetailView: View {
    
    @EnvironmentObject private var userStore: UserStore
    @State private var user: User
    @State private var isEditingName = false
    
    init(user: User){
        _user = State(initialValue: user)
    }
    
    
    var body: some View {
        VStack{
            Text(user.name)
                .font(.title)
            
            Button("change name"){
                isEditingName = true
            }
        }
        .navigationTitle("User Details")
        .sheet(isPresented: $isEditingName){
            ChangeNameView(user: $user)
        }
        .onChange(of: user){_, newUser in
            userStore.updateUser(newUser)
        }
    }
}

