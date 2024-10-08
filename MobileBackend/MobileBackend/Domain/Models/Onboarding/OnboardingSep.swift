//
//  OnboardingStep.swift
//  MobileBackend
//
//  Created by Nick Reichard on 10/3/24.
//

import Foundation

struct OnboardingStep: Identifiable, Hashable {
    let id: UUID = UUID()
    let title: String
    let imageName: String
    let description: String
}
