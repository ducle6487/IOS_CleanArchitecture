//
//  Gradient.swift
//  IOS_CleanArchitechture
//
//  Created by Anh Đức Lê on 6/12/24.
//

import SwiftUI

public extension Gradient {
    static var electricity: Gradient {
        Gradient(colors: [
            Color.clear,
            ColorTokens.Blues.electricityBlue.opacity(0.4),
            ColorTokens.Blues.electricityBlue.opacity(0.4),
            ColorTokens.Blues.electricityBlue.opacity(0.6),
            ColorTokens.Blues.electricityBlue.opacity(0.8),
            ColorTokens.Blues.electricityBlue.opacity(0.8),
            ColorTokens.Blues.electricityBlue.opacity(0.6),
            ColorTokens.Blues.electricityBlue.opacity(0.4),
            ColorTokens.Blues.electricityBlue.opacity(0.4),
            Color.clear,
        ])
    }
    
    static func linearGradient(colors: [Color]) -> LinearGradient {
        return LinearGradient(colors: colors, startPoint: .topLeading, endPoint: .bottomTrailing)
    }
    
    static func angularGradientWithShadow(
        colors: [Color]? = nil
    ) -> AngularGradient {
        return AngularGradient(
            gradient: Gradient(
                colors: colors ??
                    [
                        ColorTokens.AngularGradient.pink,
                        ColorTokens.AngularGradient.orange,
                        ColorTokens.AngularGradient.yellow,
                        ColorTokens.AngularGradient.cyan,
                        ColorTokens.AngularGradient.purple,
                    ]
            ),
            center: .center
        )
    }
    
    static func matte(_ color: Color, intensity: CGFloat = 0.5) -> Gradient {
        let uiColor = UIColor(color)
        let i = min(max(intensity, 0), 1)
        
        let red = uiColor.redValue
        let green = uiColor.greenValue
        let blue = uiColor.blueValue
        
        let newRed = red+(1-red) * 0.7
        let newGreen = green+(1-green) * 0.7
        let newBlue = blue+(1-blue) * 0.7
        
        let colors = [
            UIColor(red: newRed, green: newGreen, blue: newBlue, alpha: 1.0 * i),
            UIColor(red: newRed, green: newGreen, blue: newBlue, alpha: 0.85 * i),
            UIColor(red: newRed, green: newGreen, blue: newBlue, alpha: 0.6 * i),
            UIColor(red: newRed, green: newGreen, blue: newBlue, alpha: 0.3 * i),
            UIColor(red: newRed, green: newGreen, blue: newBlue, alpha: 0.0 * i),
            uiColor,
        ]
        
        return Gradient(colors: colors.map { Color($0) })
    }
    
    static func glossy(_ color: Color, intensity: CGFloat = 0.5) -> Gradient {
        let uiColor = UIColor(color)
        let i = min(max(intensity, 0), 1)
        
        let colors = [
            UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.90 * i),
            UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.90 * i),
            UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.80 * i),
            UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.50 * i),
            UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.10 * i),
            UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.00 * i),
            UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.00 * i),
            UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.00 * i),
            UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.00 * i),
            uiColor,
        ]
        
        return Gradient(colors: colors.map { Color($0) })
    }
    
    static func hyperGlossy(_ color: Color, intensity: CGFloat = 1.0) -> Gradient {
        let uiColor = UIColor(color)
        let i = min(max(intensity, 0), 1)
        
        let colors = [
            UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.40 * i),
            UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.20 * i),
            UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.00),
            uiColor,
        ]
        
        return Gradient(colors: colors.map { Color($0) })
    }
}

extension UIColor {
    var redValue: CGFloat { return CIColor(color: self).red }
    var greenValue: CGFloat { return CIColor(color: self).green }
    var blueValue: CGFloat { return CIColor(color: self).blue }
    var alphaValue: CGFloat { return CIColor(color: self).alpha }
}

struct Gradient_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            RoundedCorner()
                .fill(Gradient.angularGradientWithShadow())
                .frame(width: 88, height: 88)
                .blur(radius: 8)
                .opacity(0.6)
            
            RoundedCorner()
                .fill(.white)
                .frame(width: 56, height: 56)
        }
    }
}
