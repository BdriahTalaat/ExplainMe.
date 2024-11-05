//
//  ProjectItem.swift
//  ExplainMe
//
//  Created by Bdriah Talaat on 27/04/1446 AH.
//

import SwiftUI

struct ProjectItem: View {
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
        
    }
}

#Preview {
    ProjectItem()
}
