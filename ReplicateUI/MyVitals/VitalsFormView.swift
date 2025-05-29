//
//  VItalsFormView.swift
//  ReplicateUI
//
//  Created by Damian Jardim on 5/28/25.
//
/*
 
 
 We're now officially in build mode.
 🎯 Goal:
 Create a VitalsFormView that:
 Displays a SwiftUI Form
 Has these sections:
 Auto-filled Date
 Inputs for each vital (optional, typed)
 Notes area
 Submit button

 
 */

import SwiftUI

struct VitalsFormView: View {
    
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    
    @State private var bloodpressureSystolic:Int = 0
    @State private var bloodpressureDiastolic:Int = 0

    
    var body: some View{
        NavigationStack{
            Form{
                Section("Name"){
                    TextField("First Name:", text: $firstName)
                    TextField("Last Name:", text: $lastName)
                }
                
                // blood pressure
                TextField(
                    "Blood pressure systolic",
                    value: $bloodpressureSystolic,
                    format: .number
                )
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal)
                
                TextField(
                    "Blood pressure diastolic",
                    value: $bloodpressureDiastolic,
                    format: .number
                )
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal)
//              
//
//                TextField(
//                    ///             "Currency (USD)",
//                    ///             value: $myMoney,
//                    ///             format: .currency(code: "USD")
//                    ///         )
//                TextField("Systolic", value: <#T##Binding<_?>#>)
//                // heartrate
//                // body temp
//                // weight
//                // notes
//                // date time

            }
        }
    }
}

#Preview {
    VitalsFormView()
}
