//
//  SpaceGameView.swift
//  ReplicateUI
//
//  Created by Damian Jardim on 4/30/25.
//
/*
 
 🧑‍🚀 You’re building a space game. The player can choose their spaceship color — Red, Blue, or Green — from a Settings screen.
 Your mission:
 Save the selected color so when the player reopens the app, it stays the same.
 🚀 Exercise 1: Save & Load a spaceship color using UserDefaults.
 Write the Swift code for:
 Saving a string like "Red" as the selected spaceship color.
 Reading it back and printing it.
 You’re allowed to use UserDefaults.standard.
 Ready? Send me your code, and I’ll review and help you improve it!
 
 */

import SwiftUI

enum ShipColor{
    case red{1}
    case green
    case blue
    
    var id: Self {self}
}

struct SpaceGameView: View {
    
    @State private var shipColor: ShipColor = ShipColor.red
    
    var shipColorKey = "shipColorKey"
    
    func getUserDefaults(){
    }
    
    func setUserDefaults(){
        
    }

    var body: some View {
        List {
            Picker("Ship Color", selection: $shipColor){
                Text("red").tag(ShipColor.red)
                Text("green").tag(ShipColor.green)
                Text("blue").tag(ShipColor.blue)
            }.onChange(of: shipColor){
                UserDefaults.standard.set(shipColor, forKey: shipColorKey)
            }
        }.onAppear(perform: getUserDefaults)
    }
}

#Preview {
    SpaceGameView()
}
