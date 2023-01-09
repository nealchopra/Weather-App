//
//  Extensions.swift
//  Weather App
//
//  Created by Neal Chopra on 1/7/23.
//

import Foundation
import SwiftUI

extension Double { //rounds to 0 decimals since OpenWeather API is in doubles
    func roundDouble() -> String {
        return String(format: "%.0f", self)
    }
}

extension View { //rounding corner
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners) )
    }
}
    
    struct RoundedCorner: Shape { //applies rounded corner from above
        var radius: CGFloat = .infinity
        var corners: UIRectCorner = .allCorners
        
        func path(in rect: CGRect) -> Path {
            let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
            return Path(path.cgPath)
        }
    }
