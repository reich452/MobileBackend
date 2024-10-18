//
//  AuthRoute.swift
//  MobileBackend
//
//  Created by Nick Reichard on 10/3/24.
//

import Foundation

enum AuthRoute: CaseIterable, Codable, Hashable, Identifiable  {
    case signIn
    case createAccount
    case tryForFree

    var id: AuthRoute { self }
}
