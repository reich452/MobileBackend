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
    
    private let onboardingStepsUseCase: OnboardingStepsUseCase
    private let coordinator: OnboardingCoordinator
    
    init(onboardingStepsUseCase: OnboardingStepsUseCase, coordinator: OnboardingCoordinator) {
        self.onboardingStepsUseCase = onboardingStepsUseCase
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
        steps = onboardingStepsUseCase.execute()
    }
}
