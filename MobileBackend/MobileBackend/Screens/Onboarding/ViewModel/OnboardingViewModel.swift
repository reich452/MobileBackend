//
//  OnboardingViewModel.swift
//  MobileBackend
//
//  Created by Nick Reichard on 10/3/24.
//

import Foundation

final class OnboardingViewModel: ObservableObject {
    
    @Published var steps: [OnboardingStep] = []
    @Published var currentStepIndex = 0
    
    private let coordinator: OnboardingCoordinator
    
    init(coordinator: OnboardingCoordinator) {
        self.coordinator = coordinator
        loadSteps()
    }
    
    var route: AuthRoute? {
        coordinator.route
    }
    
    var isLastStep: Bool {
        currentStepIndex == steps.count - 1
    }
    
    func nextStep() {
        if currentStepIndex < steps.count - 1 {
            currentStepIndex += 1
        }
    }
    
    func handleAuthAction(_ action: AuthRoute) {
        coordinator.navigateTo(action)
    }
    
    private func loadSteps() {
        steps = [OnboardingStep(title: "Feature 1", imageName: "onboardingIcon1", description: "Description for Feature 1"),
                 OnboardingStep(title: "Feature 2", imageName: "onboardingIcon1", description: "Description for Feature 2"),
                 OnboardingStep(title: "Feature 3", imageName: "onboardingIcon1", description: "Description for Feature 3"),
                 OnboardingStep(title: "Get Started", imageName: "onboardingIcon1", description: "Sign in, create an account, or try for free")]
        
    }
}
