//
//  OnboardingStepsUseCase.swift
//  MobileBackend
//
//  Created by Nick Reichard on 10/3/24.
//

import Foundation

final class OnboardingStepsUseCase {
    
    func execute() -> [OnboardingStep] {
        return [
            OnboardingStep(title: "Feature 1", imageName: "onboardingIcon1", description: "Description for Feature 1"),
            OnboardingStep(title: "Feature 2", imageName: "onboardingIcon1", description: "Description for Feature 2"),
            OnboardingStep(title: "Feature 3", imageName: "onboardingIcon1", description: "Description for Feature 3"),
            OnboardingStep(title: "Get Started", imageName: "onboardingIcon1", description: "Sign in, create an account, or try for free")
        ]
    }
}
