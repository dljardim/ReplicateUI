//
//  ChangeNameView.swift
//  ReplicateUI
//
//  Created by Damian Jardim on 4/29/25.
//

import SwiftUI

struct ChangeNameView: View {
    @Binding var user: User
    @State private var newName = ""
    
    // programmatically dismiss the view
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("New Name", text: $newName)
            }
            .navigationTitle("Change Name")
            .navigationBarItems(
                leading: Button("Cancel") { dismiss() },
                trailing: Button("Save") {
                    user.name = newName
                    dismiss()
                }
                    .disabled(newName.isEmpty)
            )
        }
        // state initialization in onAppear
        .onAppear {
            newName = user.name
        }
    }
}
