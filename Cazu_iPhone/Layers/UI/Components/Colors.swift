//
//  Colors.swift
//  Cazu_iPhone
//
//  Created by Gustavo Anjos on 16/04/21.
//

import Foundation
import UIKit
import SwiftUI

struct ColorsSaved {
    static let barBackgroundInit = UIColor( red: 0.467, green: 0.486, blue: 0.969, alpha: 1.0)
    static let barBackgroundFinish = UIColor( red: 0.212, green: 0.247, blue: 0.733, alpha: 1.0)
    
    static func foregroundColor() -> LinearGradient {
        return LinearGradient(gradient: Gradient(colors: [Color(ColorsSaved.barBackgroundInit), Color(ColorsSaved.barBackgroundFinish)]),startPoint: .leading, endPoint: .trailing)
    }
    
    static func backgroundColor() -> Color {
        return Color(#colorLiteral(red: 0.05882352941, green: 0.1019607843, blue: 0.1647058824, alpha: 1))
    }
}

extension View {
    public func gradientForeground(colors: [Color]) -> some View {
        self.overlay(LinearGradient(gradient: .init(colors: colors),
                                    startPoint: .leading,
                                    endPoint: .trailing))
            .mask(self)
    }
}
