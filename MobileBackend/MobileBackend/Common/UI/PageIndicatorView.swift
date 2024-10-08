//
//  PageIndicatorView.swift
//  MobileBackend
//
//  Created by Nick Reichard on 10/3/24.
//

import SwiftUI

struct PageIndicatorView: View {
    let currentIndex: Int
    let totalPages: Int
    var activeColor: Color = .blue
    var inactiveColor: Color = .gray
    var circleSize: CGFloat = 10
    var spacing: CGFloat = 8

    var body: some View {
        HStack(spacing: spacing) {
            ForEach(0..<totalPages, id: \.self) { index in
                Circle()
                    .fill(index == currentIndex ? activeColor : inactiveColor)
                    .frame(width: circleSize, height: circleSize)
            }
        }
        .padding(.top, 20)
    }
}

#Preview {
    PageIndicatorView(currentIndex: 1, totalPages: 5)
}
