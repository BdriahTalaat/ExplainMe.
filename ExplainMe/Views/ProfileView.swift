//
//  ProfileView.swift
//  ExplainMe
//
//  Created by Bdriah Talaat on 24/04/1446 AH.
//

import SwiftUI

struct ProfileView: View {
    
    //MARK: VARIABLE
    @StateObject var sharedData = SharedData()
    @State var isLiteMode = true
    @State var curentMode:ColorScheme = .light
    @State var height:CGFloat = 0
    @State var hasScrolled = true
    
    //MARK: BODY VIEW
    var body: some View {
        
        //NavigationView {
            GeometryReader { geometry in
            
                let width = geometry.size.width
                let height = geometry.size.height
 
                ZStack(alignment: .bottom){
                    
                    image
                    
                    ProfileShape(height: height, width: width)
                    
                    VStack {
                        info
                        
                        sections
                    }
                    .frame(height: geometry.size.height * 0.6)
                    .scrollIndicators(.hidden)
                    
                }
                .frame(maxWidth: .infinity,maxHeight: .infinity)
                .ignoresSafeArea()
                
            }
            .overlay(
                NavigationBar(isHome: false, title: "Profile", hasScrolled: $hasScrolled)
            )
       // }
        //.preferredColorScheme(sharedData.mode)
        
    }
    
    //MARK: VIEWS
    var sections: some View{
        List{
            // First Section with Navigation Links
            Section {
                
                Picker(selection: $sharedData.selectedLanguage, label: Label("Language", systemImage: "captions.bubble")) {
                        Text("Arabic").tag(LanguageModel.arabic)
                        Text("English").tag(LanguageModel.english)
                }
                
                NavigationLink(destination: HomeView()) { // frist way
                    Label("Change Password",systemImage: "key.fill")
                    
                }
                
            }
            .accentColor(.primary)
            .listRowSeparatorTint(.blue)
            .listRowSeparator(.hidden)
            
            // Second Section with Toggle
            Section{
                Toggle(isOn: $isLiteMode){
                    Label(isLiteMode ? "Lite Mode" : "Dark Mode", systemImage: isLiteMode ? "sun.max.fill" : "moon.fill")
                }
                .onChange(of: isLiteMode) { newValue in
                    // Trigger the light/dark mode change
                    sharedData.mode = isLiteMode ? .light : .dark
                }
            }
            .accentColor(.primary)
            
            // Third Section with Alternative Navigation Links
            Section {
                NavigationLink{ Text("Billing") } label: {   // second way
                    Label("Billing",systemImage: "creditcard")
                }
                NavigationLink{ HomeView()} label: {
                    Label("Help",systemImage: "questionmark")
                }
            }
            .listRowSeparator(.hidden)
            
            
        }
        .scrollContentBackground(.hidden)
        
        .shadow(color:Color.black.opacity(0.3),radius: 20,x:0,y: 10)
        .padding(.bottom,90)
    }
   
    var info: some View {
        VStack{
            Text("User name")
                .font(.title2.bold())
            Text("Email Bdriah@gmail.com")
                .font(.title2.bold())
        }
    }
    
    var menu: some View {
        Section {
            // There are two way to navigation link
            
            NavigationLink(destination: HomeView()) { // frist way
                Label("Setting",systemImage: "gear")
                    
            }
            NavigationLink{ Text("Billing") } label: {   // second way
                Label("Billing",systemImage: "creditcard")
            }
            NavigationLink{ HomeView()} label: {
                Label("Help",systemImage: "questionmark")
            }
                
        }
        .accentColor(.primary)
        .listRowSeparatorTint(.blue)
        .listRowSeparator(.hidden)
        
    }
    
    var image: some View {
        GeometryReader { geometry in
            VStack{
                Image("Profile")
                    .resizable()
                    .scaledToFill()
                    .frame(height: geometry.size.height * 0.57)
                    .frame(maxWidth: .infinity)
                   // .blur(radius: 2)
                
            }
            Spacer()
        }
    }
    
    // Function to change the language
    func changeLanguage(to newLanguage: LanguageModel) {
        sharedData.selectedLanguage = newLanguage
    }

}

#Preview {
    ProfileView()
}

