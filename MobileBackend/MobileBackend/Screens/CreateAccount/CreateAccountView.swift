//
//  CreateAccountView.swift
//  MobileBackend
//
//  Created by Nick Reichard on 10/3/24.
//

import AuthenticationServices
import SwiftUI

struct CreateAccountView: View {
    // Get an instance of AuthorizationController using SwiftUI's @Environment
    @Environment(\.authorizationController) private var authorizationController
    @State private var authorizationResult: String = ""
    @State private var errorMessage: String?

    var body: some View {
        VStack {
            Button("Sign In") {
                Task {
                    do {
                        // Create the authorization request.
                        let request = try await makeAuthorizationRequest()
                        
                        // Perform the request and await its result.
                        let result = try await authorizationController.performRequest(request)
                        
                        // Process the request's result.
                        switch result {
                        case let appleIDCredential as ASAuthorizationAppleIDCredential:
                            handleAppleIDCredential(appleIDCredential)
                        default:
                            errorMessage = "Unexpected credential type."
                        }
                    } catch {
                        // Handle any authorization errors.
                        errorMessage = error.localizedDescription
                    }
                }
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(8)

            // Show result or error message.
            if !authorizationResult.isEmpty {
                Text("Authorization Result: \(authorizationResult)")
                    .padding()
            }

            if let errorMessage = errorMessage {
                Text("Error: \(errorMessage)")
                    .foregroundColor(.red)
                    .padding()
            }
        }
        .padding()
    }

    // Function to create the authorization request.
    private func makeAuthorizationRequest() async throws -> ASAuthorizationAppleIDRequest {
        let provider = ASAuthorizationAppleIDProvider()
        let request = provider.createRequest()
        request.requestedScopes = [.fullName, .email]
        return request
    }

    // Handle the authorization result.
    private func handleAppleIDCredential(_ credential: ASAuthorizationAppleIDCredential) {
        if let fullName = credential.fullName {
            authorizationResult = "Signed in as \(fullName.givenName ?? "") \(fullName.familyName ?? "")"
        } else {
            authorizationResult = "Signed in with Apple ID"
        }

        if let email = credential.email {
            authorizationResult += "\nEmail: \(email)"
        }

        let userID = credential.user
        authorizationResult += "\nUser ID: \(userID)"
        
    }
}

#Preview {
    CreateAccountView()
}
