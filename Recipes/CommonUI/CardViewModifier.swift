//
//  CardViewModifier.swift
//  Recipes
//
//  Created by Brayden Harris on 2/22/25.
//

import SwiftUI

private struct CardViewModifier: ViewModifier {
    var insets: EdgeInsets
    var backgroundColor: Color
    var borderColor: Color
    var cornerRadius: CGFloat
    var roundedCornerStyle: RoundedCornerStyle
    
    func body(content: Content) -> some View {
        content
            .background(backgroundColor)
            .clipShape(cardShape)
            .overlay(
                cardShape
                    .stroke(borderColor, lineWidth: 1)
            )
            .padding(insets)
    }
    
    private var cardShape: some Shape {
        RoundedRectangle(
            cornerRadius: cornerRadius,
            style: roundedCornerStyle
        )
    }
}

extension View {
    func cardBackground(
        insets: EdgeInsets,
        backgroundColor: Color = .clear,
        borderColor: Color = .primary,
        cornerRadius: CGFloat = 8.0,
        roundedCornerStyle: RoundedCornerStyle = .continuous
    ) -> some View {
        modifier(
            CardViewModifier(
                insets: insets,
                backgroundColor: backgroundColor,
                borderColor: borderColor,
                cornerRadius: cornerRadius,
                roundedCornerStyle: roundedCornerStyle
            )
        )
    }
}

#Preview {
    VStack {
        Text("Hello")
        Text("World")
    }
    .frame(maxWidth: .infinity)
        .cardBackground(insets: EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
}
