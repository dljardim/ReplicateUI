/*
 
 Space Ship Challenge
 
 Saving a string like "Red" as the selected spaceship color.
 Reading it back and printing it.
 You’re allowed to use UserDefaults.standard.
 
 --------------
 SpaceGameViewAdditions1 -
 
 Update your app so the spaceship actually changes color when you tap the buttons (instead of just showing the name).
 Keep your UserDefaults usage, but now visually reflect the color on the spaceship rectangle.

 add fallback defaults if no color is saved
 --------------
 */

import SwiftUI

struct TypeWriterText: View, Animatable {
    var string: String
    var count = 0
    
    var animatableData: Double {
        get { Double(count) }
        set { count = Int(max(0, newValue)) }
    }
    
    var body: some View {
        let stringToShow = String(string.prefix(count))
        Text(stringToShow)
    }
}

struct SpaceGameView1: View {
    
    @State private var selectedSpaceShipColor = ""
    private let colorKey = "colorKey"

    
    func setUserDefaults(val: String) {
        print("Saving color to UserDefaults: \(val)")
        UserDefaults.standard.set(val, forKey: colorKey)
    }
    
    func getUserDefaults() {
        guard let savedColor = UserDefaults.standard.string(forKey: colorKey) else { return }
        selectedSpaceShipColor = savedColor
    }
    
    func colorFromString(name: String) -> Color {
        print("updating color: \(selectedSpaceShipColor) -> to: \(name)")
        switch name{
            case "red": return .red
            case "green": return .green
            case "blue": return .blue
            default: return .gray
        }
    }
    
    var body: some View {
        
        VStack(spacing: 20) {

            Text(selectedSpaceShipColor.uppercased())

                .font(.largeTitle)
                .bold()
            
            RoundedRectangle(cornerRadius: 20)
                .fill(colorFromString(name: selectedSpaceShipColor))
                .frame(width: 300, height: 300)
                .overlay(
                    Image("spaceShip")
                        .resizable()
                        .scaledToFit()
                        .padding(40)
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.black, lineWidth: 1)
                )
                .shadow(radius: 5)
            
            HStack {
                ForEach(["red", "green", "blue"], id: \.self) { color in
                    Button {
                        withAnimation{
                            selectedSpaceShipColor = color
                            setUserDefaults(val: color)
                        }
                       
                    } label: {
                        Circle()
                            .fill(colorFromString(name: color))
                            .frame(width: 80, height: 80)
                    }
                }
            }
        }
        .padding()
        .onAppear {
            getUserDefaults()
            
        }
    }
}

#Preview {
    SpaceGameView1()
}
