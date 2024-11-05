//
//  SummaryView.swift
//  ExplainMe
//
//  Created by Bdriah Talaat on 13/04/1446 AH.
//

import SwiftUI

struct SummaryView: View {
    
    //MARK: VARIABLES
    @StateObject var sharedData = SharedData()
        
    //MARK: BODY VIEW
    var body: some View {
        GeometryReader { geometry in
            
            VStack{
                ScrollView{
                    Text(sharedData.selectedLanguage.rawValue.capitalized)
                    
                    Text("Summary ...")
                        .padding()
                        .frame(maxWidth: .infinity,maxHeight: .infinity,alignment: sharedData.selectedLanguage == LanguageModel.english ? .leading : .trailing)
                        .multilineTextAlignment(sharedData.selectedLanguage == LanguageModel.english ? .leading : .trailing)
                    
                }
                .padding(.top,20)
                .padding(.bottom,20)
                .background(.ultraThinMaterial)
                .mask(RoundedRectangle(cornerRadius: 20, style: .continuous))
                .padding(.horizontal,10)
                .frame(height: geometry.size.height * 0.8) // 80% of the available height
                .shadow(color:Color("Shadow").opacity(0.4),radius: 10,x:0,y: 10)
                
                // Bottom button area
                buttons
            }
            .padding(.bottom,geometry.size.height * 0.3)
            .frame(maxWidth: .infinity,maxHeight: .infinity)
            
        }
        .background(
            Color("Background")
        )
        .navigationTitle("Summary")
    }
    
    //MARK: VIEWS
    var buttons: some View{
        HStack (alignment: .bottom,spacing: 20){
            Button{
                // Download action
            }label: {
                Text("download")
                    .padding()
                    .frame(width: 130)
                    .foregroundStyle(.white)
                    .background(Color("Pink"))
                    .cornerRadius(10)
            }
            
            Button{
                // Save action
            }label: {
                Text("Save")
                    .padding()
                    .frame(width: 130)
                    .foregroundStyle(.white)
                    .background(Color("Pink"))
                    .cornerRadius(10)
            }
        }
        .padding()
        .frame(height: 70)
        .frame(maxHeight: .infinity,alignment: .bottom)

    }
}

#Preview {
    SummaryView()
}
