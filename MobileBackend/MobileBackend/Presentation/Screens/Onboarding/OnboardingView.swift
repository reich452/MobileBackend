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
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(8)
                                .padding(.horizontal)
                        }
                        
                        Button(action: {
                            viewModel.handleAuthAction(.createAccount)
                        }) {
                            Text("Create Account")
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.green)
                                .foregroundColor(.white)
                                .cornerRadius(8)
                                .padding(.horizontal)
                        }
                        
                        Button(action: {
                            viewModel.handleAuthAction(.tryForFree)
                        }) {
                            Text("Try It for Free")
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.gray)
                                .foregroundColor(.white)
                                .cornerRadius(8)
                                .padding(.horizontal)
                        }
                    }
                } else {
                    Button(action: {
                        viewModel.nextStep()
                    }) {
                        Text("Next")
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                            .padding(.horizontal)
                    }
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
