//
//  OnboardingCoordinator.swift
//  MobileBackend
//
//  Created by Nick Reichard on 10/3/24.
//

import Foundation

final class OnboardingCoordinator: ObservableObject {
    
    @Published var route: AuthRoute? = nil
    
    func navigateTo(_ action: AuthRoute) {
        route = action
    }
}
