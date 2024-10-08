//
//  AppButtonType.swift
//  MobileBackend
//
//  Created by Nick Reichard on 10/7/24.
//

import SwiftUI

enum AppButtonType {
    
    case primaryGradient
    case primary
    case secondary
    case tertiary

    var backgroundColor: Color {
        switch self {
        case .primary, .primaryGradient:
            return .primaryPurple
        case .secondary:
            // TODO: - Finalize Theme
            return .blue
        case .tertiary:
            return .gray
        }
    }
    
    var linearGradient: LinearGradient {
        // TODO: - Finalize Theme with all cases
        return LinearGradient(
            gradient: Gradient(colors: [Color.vividPurple, Color.primaryPurple]),
            startPoint: .topLeading,
            endPoint: .bottomTrailing)
    }
}
