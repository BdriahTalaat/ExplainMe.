//
//  ExplainMeApp.swift
//  ExplainMe
//
//  Created by Bdriah Talaat on 19/03/1446 AH.
//

import SwiftUI

@main
struct ExplainMeApp: App {
    
    @State var isActive = false
    @StateObject var sharedData = SharedData()
   
    var body: some Scene {
        WindowGroup {
            if isActive{
                ContentView()
                    .environmentObject(sharedData)
                    
            }
            else{
                LunchScreen()
                    .onAppear{
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0){
                            self.isActive = true
                        }
                    }
            }
        }
    }
}
