//
//  MainTabView.swift
//  CloudVsFire
//
//  Created by Nick Reichard on 1/26/24.
//

import SwiftUI

struct MainTabView: View {
    
    @Binding var selection: RootTab?
    
    var body: some View {
        TabView(selection: $selection) {
            ForEach(RootTab.allCases) { screen in
                Tab(screen.labelTitle, systemImage: screen.systemSymbol.rawValue, value: screen
                ) {
                    screen.destination
                }
            }
        }
    }
}

#Preview {
    MainTabView(selection: .constant(.home))
    
}
