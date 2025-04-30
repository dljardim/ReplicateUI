//
//  AppointmentsHome.swift
//  ReplicateUI
//
//  Created by Damian Jardim on 4/23/25.
//

import SwiftUI

struct AppointmentsHomeView: View {
    
    @State private var displayMessage = ""
    
    var body: some View {
        
        Button("Click Me"){
            let now = Date()
            print(now)
            displayMessage = now.description
        }
        
        Text("Results: \(displayMessage)")

    }
}

#Preview {
    AppointmentsHomeView()
}
