//
//  SmartAsistantView.swift
//  ExplainMe
//
//  Created by Bdriah Talaat on 24/04/1446 AH.
//

import SwiftUI

struct SmartAsistantView: View {
    
    //MARK: VATIABLE
    @State var sharedData = SharedData()
    @State var fromVideo = false
    @State var fromKnowlege = false
    @State var fromBoth = false
    var messageArray = ["Hello you","I've been How are you doing?","building SwiftUI applications from scratch and it's so much fun!"]
         
    //MARK: BODY VIEW
    var body: some View {
        VStack(spacing : 0) {
            VStack{
                methodMessage
                
                ScrollView{
                     
                    ForEach(sharedData.message,id: \.self){ text in
                        MessageBubble(message: Message(message: text, recived: false))
                        
                    }
                }
                .padding(.top, 10)
                
            }
            .background(Color("Background"))
            
            MessageField()
                .background(Color("Background"))
        }
    }
    
    //MARK: VIEWS
    var methodMessage: some View{
        VStack(alignment: .leading,spacing: 10) {
            Text("Choose answer method")
                .foregroundColor(Color("Text"))
            
            Button{
                fromVideo.toggle()
                fromKnowlege = false
                fromBoth = false
                
            }label: {
                HStack {
                    Image(systemName: fromVideo ? "checkmark.circle" : "circle")
                        .foregroundColor(Color("Text"))
                    
                    Text("From Video")
                        .font(.body.weight(.medium))
                        .foregroundColor(Color("Text"))
                }
            }
            
            Button{
                fromKnowlege.toggle()
                fromVideo = false
                fromBoth = false
                
            }label:{
                HStack {
                    Image(systemName: fromKnowlege ? "checkmark.circle" : "circle")
                        .foregroundColor(Color("Text"))
                    
                    Text("From Knowlege")
                        .font(.body.weight(.medium))
                        .foregroundColor(Color("Text"))
                }
            }
            Button{
                fromBoth.toggle()
                fromVideo = false
                fromKnowlege = false
            
            }label: {
                HStack {
                    Image(systemName: fromBoth ? "checkmark.circle" : "circle")
                        .foregroundColor(Color("Text"))
                    
                    Text("Both From Video and Knowlege")
                        .font(.body.weight(.medium))
                        .foregroundColor(Color("Text"))
                }
            }
            
        }
        .padding()
        .frame(maxWidth: .infinity,alignment: .leading)
        .background(Color.gray.opacity(0.3))
        //.cornerRadius(20)
        .shadow(color:Color("Shadow").opacity(0.5),radius: 10,x:0,y: 10)
    }
}

#Preview {
    SmartAsistantView()
}
