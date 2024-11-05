//
//  LastProjectItem.swift
//  ExplainMe
//
//  Created by Bdriah Talaat on 24/03/1446 AH.
//

import SwiftUI

struct LastProjectItem: View {
    
    @State var title = ""
    @State var contentType = ""
    @State private var currentIndex = 0
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            RoundedRectangle(cornerRadius: 20)
                .fill(.black.opacity(0.2))
                .frame(height: 90)
                .overlay(
                    Image("Quiz")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 150,height: 100)
                )
            
            
            Text("Title \(title)")
                .multilineTextAlignment(.leading)
            
            Text("Content Type \(contentType)")
            
            Spacer()
        }
        .padding()
        .frame(maxWidth: 200)
        .frame(height: 200)
        .background(.ultraThinMaterial,in: RoundedRectangle(cornerRadius: 30, style: .continuous))
        .strokeStyle(cornerRadius: 30)
        .background(
            RoundedRectangle(cornerRadius: 30, style: .continuous)
                .fill(.linearGradient(colors: [.teal, .blue], startPoint: .topLeading, endPoint: .bottomTrailing))
                .rotation3DEffect(.degrees(10), axis: (x: 0, y: 1, z: 0),anchor: .bottomTrailing)
                .rotationEffect(.degrees(180))
                .padding(.trailing,40)
        )
    }
    
    
}

#Preview {
    LastProjectItem()
}
