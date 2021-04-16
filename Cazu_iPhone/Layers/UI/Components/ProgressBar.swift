//
//  ProgressBar.swift
//  Cazu_iPhone
//
//  Created by Gustavo Anjos on 16/04/21.
//

import SwiftUI
import UIKit

struct ProgressBar: View {
    private let value: Double
    private let maxValue: Double
    private let backgroundEnabled: Bool
    private let backgroundColor: Color
    private let foregroundColor: LinearGradient
    
    init(value: Double,
         maxValue: Double,
         backgroundEnabled: Bool = true,
         backgroundColor: Color = ColorsSaved.backgroundColor(),
         foregroundColor: LinearGradient = ColorsSaved.foregroundColor()) {
        self.value = value
        self.maxValue = maxValue
        self.backgroundEnabled = backgroundEnabled
        self.backgroundColor = backgroundColor
        self.foregroundColor = foregroundColor
    }
    
    var body: some View {
        
        ZStack {
            GeometryReader { geometryReader in
                
                if self.backgroundEnabled {
                    Capsule()
                        .foregroundColor(self.backgroundColor)
                }
                
                Capsule()
                    .frame(width: self.progress(value: self.value,
                                                maxValue: self.maxValue,
                                                width: geometryReader.size.width))
                    .frame(height: 9)
                    .gradientForeground(colors: [Color(ColorsSaved.barBackgroundInit), Color(ColorsSaved.barBackgroundFinish)])
                    .animation(.easeIn)
            }
        }
    }
    
    private func progress(value: Double,
                          maxValue: Double,
                          width: CGFloat) -> CGFloat {
        let percentage = value / maxValue
        return width *  CGFloat(percentage)
    }
}
