//
//  userDefaultsCounter.swift
//  ReplicateUI
//
//  Created by Damian Jardim on 5/1/25.
//

import SwiftUI

struct userDefaultsCounter: View {
    
    
    @State private var count = 0
    let userDefaultKey = "count"
    
    func getUserDefaults(){
        count = UserDefaults.standard.integer(forKey: userDefaultKey)
    }
    
    var body: some View {
        VStack{
            Spacer()
            Text("Counter: \(count)")
            Spacer()
            
            // full width button
            Button {
                print("add button click")
                count = count + 1
                UserDefaults.standard.set(count, forKey: userDefaultKey)
            } label: {
                Text("ADD")
                    .frame(maxWidth: .infinity)
                    .padding(.vertical)
            }.padding()
                .buttonStyle(.borderedProminent)
            
        }.onAppear(perform: getUserDefaults)
    }
}

#Preview {
    userDefaultsCounter()
}
