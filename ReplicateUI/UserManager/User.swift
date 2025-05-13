//
//  User.swift
//  ReplicateUI
//
//  Created by Damian Jardim on 4/29/25.
//

import Foundation

// Hasahable - can be used as value in NavigationLink
struct User: Identifiable, Hashable {
    let id: UUID
    var name: String
    
    // sets a default value for UUID if not provided 
    init(id: UUID = UUID(), name: String) {
        self.id = id
        self.name = name
    }
}
