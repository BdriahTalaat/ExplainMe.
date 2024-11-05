//
//  AngularButtonStyle.swift
//  ExplainMe
//
//  Created by Bdriah Talaat on 19/03/1446 AH.
//

import SwiftUI

struct AngularButtonStyle: ButtonStyle{
    @Environment(\.controlSize) var controlSize
    
    var extraPadding : CGFloat{
        switch controlSize{
        case .mini:
            return 0
            
        case .small:
            return 0
            
        case .regular:
            return 4
            
        case .large:
            return 10
            
        @unknown default:
            return 0
        }
    }
    
    var cornerRadius : CGFloat{
        switch controlSize{
        case .mini:
            return 12
            
        case .small:
            return 12
            
        case .regular:
            return 16
            
        case .large:
            return 20
            
        @unknown default:
            return 12
        }
    }
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.horizontal,10 + extraPadding)
            .padding(.vertical,4 + extraPadding)
        
            .background(
                RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                    .fill(.linearGradient(colors: [Color(.systemBackground)], startPoint: .top, endPoint: .bottom))
                    .blendMode(.softLight)
            )
        
            .background(
                RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                    .fill(.angularGradient(colors: [Color("Pink"),Color("Blue"),Color("Yellow"),Color("Pink")], center: .center, startAngle: .degrees(-90), endAngle: .degrees(270)))
                    .blur(radius: cornerRadius)
            )
        
    }
    
}

extension ButtonStyle where Self == AngularButtonStyle{
    static var angular: Self {
        return .init()
    }
}
