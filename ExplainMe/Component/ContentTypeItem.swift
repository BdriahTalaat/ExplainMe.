//
//  ContentTypeItem.swift
//  ExplainMe
//
//  Created by Bdriah Talaat on 21/03/1446 AH.
//

import SwiftUI

struct ContentTypeItem: View {
    
    var content : TypeContent = contentType[0]
    
    var body: some View {
        VStack (alignment: .leading,spacing:10 ){
           
            
            Spacer()
            Text(content.type)
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(.linearGradient(colors: [.primary,.primary.opacity(0.5)], startPoint: .topLeading, endPoint: .bottomTrailing))
            
            Text(content.descripe)
                .font(.footnote)
                .fontWeight(.semibold)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .frame(height: 350)
        .background(.ultraThinMaterial)
        .mask(RoundedRectangle(cornerRadius: 20, style: .continuous))
        .strokeStyle(cornerRadius: 20)
        .padding(.horizontal,20)
    }
}

#Preview {
    ContentTypeItem()
}
