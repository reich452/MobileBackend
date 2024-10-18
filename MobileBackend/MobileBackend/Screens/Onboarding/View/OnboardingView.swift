//
//  OnboardingView.swift
//  MobileBackend
//
//  Created by Nick Reichard on 10/3/24.
//

import SwiftUI

struct OnboardingView: View {
    
    @State private var rootTabSelection: RootTab? = .home
    @ObservedObject var viewModel: OnboardingViewModel
    
    var body: some View {
        NavigationStack {
            VStack {
                TabView(selection: $viewModel.currentStepIndex) {
                    ForEach(0..<viewModel.steps.count, id: \.self) { index in
                        let step = viewModel.steps[index]
                        
                        VStack {
                            Image(step.imageName)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 200)
                            Text(step.title)
                                .font(.title)
                                .padding(.top, 20)
                            Text(step.description)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding()
                        }
                        .tag(index)
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                
                if !viewModel.isLastStep {
                    PageIndicatorView(currentIndex: viewModel.currentStepIndex,
                                      totalPages: viewModel.steps.count - 1,
                                      activeColor: .blue,
                                      inactiveColor: .gray)
                }
                
                
                if viewModel.isLastStep {
                    VStack {
                        Button(action: {
                            viewModel.handleAuthAction(.signIn)
                        }) {
                            Text("Sign In")
                        }
                        .buttonStyle(AppButtonStyle(type: .primaryGradient))
                        
                        Button(action: {
                            viewModel.handleAuthAction(.createAccount)
                        }) {
                            Text("Create Account")
                        }
                        .buttonStyle(AppButtonStyle(type: .secondary))
                        
                        Button(action: {
                            viewModel.handleAuthAction(.tryForFree)
                        }) {
                            Text("Try It for Free")
                        }
                        .buttonStyle(AppButtonStyle(type: .tertiary))
                    }
                } else {
                    Button(action: {
                        viewModel.nextStep()
                    }) {
                        Text("Next")
                    }
                    .buttonStyle(AppButtonStyle(type: .primaryGradient))
                }
            }
            .navigationDestination(for: AuthRoute.self) { action in
                switch action {
                case .signIn:
                    CreateAccountView()
                case .createAccount:
                    CreateAccountView()
                case .tryForFree:
                    MainTabView(selection: $rootTabSelection)
                }
            }
        }
    }
}

#Preview {
    //    OnboardingView()
}
