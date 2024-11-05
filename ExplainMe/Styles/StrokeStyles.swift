//
//  StrokeStyles.swift
//  ExplainMe
//
//  Created by Bdriah Talaat on 23/03/1446 AH.
//
import SwiftUI

struct StrokeStyles: ViewModifier {
    
    var cornerRadius:CGFloat
    @Environment(\.colorScheme) var colorScheme
    
    func body(content: Content) -> some View {
        content.overlay(
            RoundedRectangle(
                cornerRadius: cornerRadius,style: .continuous)
            .stroke(
                    .linearGradient(
                        colors: [.white.opacity(colorScheme == .dark ? 0.3: 0.3),
                                 .black.opacity(colorScheme == .dark ? 0.3 : 0.1)],
                        startPoint: .top, endPoint: .bottom))
                .blendMode(.overlay)
        )
    }
}

extension View{
    func strokeStyle(cornerRadius:CGFloat = 20) -> some View{
        modifier(StrokeStyles(cornerRadius: cornerRadius))
    }
}
