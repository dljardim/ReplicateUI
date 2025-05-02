import SwiftUI
import UIKit


extension Color {
    init(hex: String) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")
        
        var rgb: UInt64 = 0
        Scanner(string: hexSanitized).scanHexInt64(&rgb)
        
        let r = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
        let g = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
        let b = CGFloat(rgb & 0x0000FF) / 255.0
        let a = CGFloat(1.0)
        
        self.init(red: r, green: g, blue: b, opacity: a)
    }
}

extension Color {
    var hexString: String {
        let uicolor = UIColor(self)
        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 0
        uicolor.getRed(&r, green: &g, blue: &b, alpha: &a)
        
        let rgb: Int = (Int)(r * 255) << 16 | (Int)(g * 255) << 8 | (Int)(b * 255)
        return String(format: "#%06x", rgb)
    }
}

// Extension to convert SwiftUI Color to UIColor
extension UIColor {
    convenience init(_ swiftUIColor: Color) {
        var cgColor: CGColor = UIColor.clear.cgColor
        if let cgColorValue = swiftUIColor.cgColor {
            cgColor = cgColorValue
        }
        self.init(cgColor: cgColor)
    }
}

// Extension to get CGColor from SwiftUI Color
extension Color {
    var cgColor: CGColor? {
        let uicolor = UIColor(self)
        return uicolor.cgColor
    }
}


extension Color {
    
    init?(wordName: String) {
        switch wordName {
            case "clear":       self = .clear
            case "black":       self = .black
            case "white":       self = .white
            case "gray":        self = .gray
            case "red":         self = .red
            case "green":       self = .green
            case "blue":        self = .blue
            case "orange":      self = .orange
            case "yellow":      self = .yellow
            case "pink":        self = .pink
            case "purple":      self = .purple
            case "primary":     self = .primary
            case "secondary":   self = .secondary
            default:            return nil
        }
    }
}
/*
 
 
 Usage
 
 Converting Hex to Color:
 let color = Color(hex: "#FF5733")
 
 Converting Color to Hex:
 let hexString = color.hexString
 print(hexString) // Output: #ff5733

 
 
 */
