//
//  LunchScreen.swift
//  ExplainMe
//
//  Created by Bdriah Talaat on 18/04/1446 AH.
//

import SwiftUI

struct LunchScreen: View {
    
    //MARK: VARIABLE
    @StateObject var sharedData = SharedData()
    
    //MARK: BODY VIEW
    var body: some View {
        VStack {
            
            Image("Lunch Screen")
                .resizable()
                .scaledToFit()
                .frame(height: 300)
                .frame(maxWidth: 700)
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity)
        .background(Color("Background"))
           
    }
}

#Preview {
    LunchScreen()
}
