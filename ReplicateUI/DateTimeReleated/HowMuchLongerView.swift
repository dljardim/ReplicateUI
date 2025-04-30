//
//  HowMuchLongerView.swift
//  ReplicateUI
//
//  Created by Damian Jardim on 4/23/25.
//

import SwiftUI

struct HowMuchLongerView: View {
    @State private var dateSelected: Date = Date()
    
    var body: some View {
        Text("HowMuchLongerView")
        DatePicker("Date", selection: $dateSelected)
    }
}

#Preview {
    HowMuchLongerView()
}
