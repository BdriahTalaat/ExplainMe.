//
//  MessageField.swift
//  ExplainMe
//
//  Created by Bdriah Talaat on 24/04/1446 AH.
//

import SwiftUI

struct MessageField: View {
    
    @State var isActiveSend = false
    @State var sharedData = SharedData()
    @State var message = ""
    
    var body: some View {
        HStack {
            CustomTextField(placetholder: Text("Enter your message ..."), text: $message)
            
            Button{
                
                sharedData.message.append(message)
                message = ""
               
            }label: {
                Image(systemName: "paperplane.fill")
                    .foregroundColor(Color.white)
                    .padding(10)
                    .background(message.isEmpty ? Color("Pink").opacity(0.3) : Color("Pink"))
                    .cornerRadius(50)
            }
            .disabled(message.isEmpty)
            
        }
        .padding(.horizontal)
        .padding(.vertical, 10)
        .background(Color.gray.opacity(0.3))
        .cornerRadius(50)
        .padding()
    }
}

#Preview {
    MessageField()
}

struct CustomTextField: View {
    
    var commit : () -> () = {}
    var editingChanged : (Bool) -> () = {_ in}
    var placetholder:Text
    @Binding var text : String
    
    var body: some View {
        ZStack(alignment: .leading){
            if text.isEmpty{
                placetholder
                    .opacity(0.5)
            }
            
            TextField("",text: $text,onEditingChanged: editingChanged,onCommit: commit)
        }
    }
}
