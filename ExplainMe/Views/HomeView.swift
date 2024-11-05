//
//  TypeContentView.swift
//  ExplainMe
//
//  Created by Bdriah Talaat on 21/03/1446 AH.
//

import SwiftUI

struct HomeView: View {
    
    //MARK: VARIABLE
    @StateObject var sharedData = SharedData()
    @State var hasScrolled = true
    @State var title:String = ""
    let column = [GridItem(.adaptive(minimum: 150),spacing: 20)]
     
    //MARK: BODY VIEW
    var body: some View {
        
        NavigationView{
            
            VStack {
                
                ScrollView {
                    scrollDetaction
                    
                    content
                        .padding(.top,80)
                    
                    Text("Last Project".uppercased())
                        .font(.footnote.bold())
                        .frame(maxWidth: .infinity,alignment: .leading)
                        .padding(.horizontal,20)
                    
                    LazyVGrid(columns:column,spacing: 40){
                        
                        ForEach(0 ..< 5) { item in
                            LastProjectItem()
                                .shadow(color:Color("Shadow").opacity(0.4),radius: 10,x:0,y: 10)
                        }
                        
                    }
                    .padding(20)
                }
                .scrollIndicators(.hidden)
                .overlay(
                    NavigationBar(isHome: true, title: "Home", hasScrolled: $hasScrolled)
                )
                .frame(maxWidth:.infinity, maxHeight: .infinity)
                .background(
                    Color("Background")
                )
                
            }
            
        }
    }
    
    //MARK: VIEWS
    var content: some View {
        TabView {
            ForEach(Array(contentType.enumerated()), id: \.offset) { index, content in
                
                GeometryReader { proxy in
                    let minX = proxy.frame(in: .global).minX
                    
                    
                    NavigationLink(destination: UploadView(title:content.type)) {
                        
                        ContentTypeItem(content: content)
                            .frame(maxWidth: 600)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical,40)
                            .rotation3DEffect(.degrees(minX / -10), axis: (x: 0, y: 1, z: 0))
                            .shadow(color:Color("Shadow").opacity(0.4),radius: 10,x:0,y: 10)
                            .overlay (
                                Image(content.image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 250)
                                    .offset(x: 32,y: -80)
                                    .offset(x: minX / 2)
                            )
                            .blur(radius:abs(minX) / 40)
                        
                    }
                    
                }
            }
            
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
        .frame(height: 430)
        .background(
            Image("Blob")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 700)
                .offset(x:200,y:-100)
        )
        
    }
    
    var scrollDetaction: some View{
        
        GeometryReader{ proxy in
            Color.clear.preference(key: ScrollPreferenceKey.self, value: proxy.frame(in: .named("scroll")).minY)
        }
        .onPreferenceChange(ScrollPreferenceKey.self, perform: { value in
            
            withAnimation(.easeInOut){
                if value < 0 {
                    hasScrolled = true
                }else{
                    hasScrolled = false
                }
            }
        })
    }
    
    var lastProject: some View{
        VStack(alignment:.leading, spacing: 10) {
            
        }
    }
    
}

#Preview {
    HomeView()
}
