//
//  AppButtonStyle.swift
//  CloudVsFire
//
//  Created by Nick Reichard on 10/7/24.
//

import SwiftUI

struct AppButtonStyle: ButtonStyle {
    
    var type: AppButtonType
    var fontWeight: Font.Weight = .semibold
    var cornerRadius: CGFloat = 8
    var horizontalPadding: CGFloat = 16
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .font(.system(.callout, weight: fontWeight))
            .frame(maxWidth: .infinity)
            .background(
                Group {
                    if type == .primaryGradient {
                        type.linearGradient
                    } else {
                        type.backgroundColor
                    }
                }
            )
            .foregroundColor(.white)
            .cornerRadius(cornerRadius)
            .opacity(configuration.isPressed ? 0.7 : 1)
            .padding(.horizontal, horizontalPadding)
    }
}

private struct PrimaryTestButton: View {
    
    var body: some View {
        
        Button("Test This") {
            
        }.buttonStyle(AppButtonStyle(type: .primary))
    }
}

#Preview {
    PrimaryTestButton()
}
