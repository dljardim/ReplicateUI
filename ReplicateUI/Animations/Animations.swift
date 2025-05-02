//
//  Animations.swift
//  ReplicateUI
//
//  Created by Damian Jardim on 5/2/25.
//

import SwiftUI

struct Animations: View {
    
    @State private var isRed:Bool = false
    
    var body: some View {
        Rectangle()
            .fill(isRed ? Color.red : Color.blue)
            .frame(width: 200, height: 200)
            .onTapGesture {
                withAnimation{
                    isRed.toggle()
                }
            }
    }
}

#Preview {
    Animations()
}
