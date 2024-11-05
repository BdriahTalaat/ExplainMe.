//
//  ContentView.swift
//  ExplainMe
//
//  Created by Bdriah Talaat on 19/03/1446 AH.
//

import SwiftUI

struct ContentView: View {
   
    @AppStorage("selectedTab") var selectedTab : Tab = .home
    @StateObject var sharedData = SharedData()
    
    var body: some View {
        ZStack (alignment: .bottom){
            switch selectedTab {
                
            case .home:
                HomeView()
                
            case .profile:
                ProfileView()
                
            case .projects:
                ProjectsView()
            }
            
            TabBar()
        }
        .safeAreaInset(edge: .bottom) {
            Color.clear.frame(height: 44)
        }
       // .preferredColorScheme(sharedData.mode) // Apply the color scheme based on sharedData.mode
    }
}

#Preview {
    ContentView()
}
