//
//  NavigationBar.swift
//  ExplainMe
//
//  Created by Bdriah Talaat on 21/03/1446 AH.
//

import SwiftUI

struct NavigationBar: View {
    
    var isHome:Bool
    var title:String = ""
    @Binding var hasScrolled :Bool
   
    var body: some View {
        ZStack {
            
            Color.clear
                .background(.ultraThinMaterial)
                .blur(radius: 10)
                .opacity(hasScrolled ? 1 : 0)
            
            Text(title)
                .frame(maxWidth: .infinity,alignment: .leading)
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.leading,20)
                .padding(.top,20)
                .offset(y: hasScrolled ? -4 : 0)
            
            if isHome{
                HStack {
                    Button{
                        
                    }
                    label: {
                        Image(systemName: "magnifyingglass")
                            .font(.body.weight(.bold))
                            .frame(width: 36,height: 36)
                            .foregroundColor(.secondary)
                            .background(.ultraThinMaterial,in: RoundedRectangle(cornerRadius: 14, style: .continuous))
                            .strokeStyle(cornerRadius: 14)
                    }
                    
                    Button{
                        
                    }
                    label: {
                        Image(systemName: "questionmark")
                            .font(.body.weight(.bold))
                            .frame(width: 36,height: 36)
                            .foregroundColor(.secondary)
                            .background(.ultraThinMaterial,in: RoundedRectangle(cornerRadius: 14, style: .continuous))
                            .strokeStyle(cornerRadius: 14)
                    }
                }
                .frame(maxWidth: .infinity,alignment: .trailing)
                .padding(.trailing,20)
                .padding(.top,20)
            }
            
        }
        .frame(height: hasScrolled ? 44 : 70)
        .frame(maxHeight: .infinity,alignment: .top)
    }
}

#Preview {
    NavigationBar(isHome: true, title: "Home", hasScrolled: .constant(false))
}
