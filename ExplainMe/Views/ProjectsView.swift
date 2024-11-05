//
//  ProjectsView.swift
//  ExplainMe
//
//  Created by Bdriah Talaat on 27/04/1446 AH.
//

import SwiftUI

struct ProjectsView: View {
    
    //MARK: VARRIABLE
    let column = [GridItem(.adaptive(minimum: 150),spacing: 20)]
    @State var hasScrolled = true
    
    //MARK: BODY VIEW
    var body: some View {
        
        VStack {
            ScrollView {
                LazyVGrid(columns:column,spacing: 40){
                    
                    ForEach(0 ..< 5) { item in
                        ProjectItem()
                            .shadow(color:Color("Shadow").opacity(0.4),radius: 10,x:0,y: 10)
                        
                    }
                    
                }
                .padding(.horizontal,20)
                .padding(.top,80)
                .padding(.bottom,50)
            }
            
            .scrollIndicators(.hidden)
            .overlay(
                NavigationBar(isHome: false, title: "Projects", hasScrolled: $hasScrolled)
            )
            .frame(maxWidth: .infinity,maxHeight: .infinity)
            .background(
                Image("Blob")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 700)
                    .offset(x:200,y:-150)
                    .blur(radius: 5)
            )
            .background(
                Color("Background")
            )
            
        }
    }
}

#Preview {
    ProjectsView()
}
