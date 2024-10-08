//
//  MobileBackendApp.swift
//  MobileBackend
//
//  Created by Nick Reichard on 8/21/24.
//

import SwiftUI
import SwiftData

@main
struct MobileBackendApp: App {
   
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @State private var selection: RootTab? = .home

    var body: some Scene {
        WindowGroup {
            OnboardingView(viewModel: OnboardingViewModel(onboardingStepsUseCase: OnboardingStepsUseCase(), coordinator: OnboardingCoordinator()))
        }
    }
}
