//
//  Item.swift
//  MobileBackend
//
//  Created by Nick Reichard on 8/21/24.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
