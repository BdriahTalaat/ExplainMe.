//
//  UploadItem.swift
//  ExplainMe
//
//  Created by Bdriah Talaat on 27/03/1446 AH.
//

import SwiftUI

struct UploadItem: View {
    
    @State var uploadText = ""
    @FocusState var focusField:Field?
    
    enum Field:Hashable{
        case upload
    }
    
    
    var body: some View {
        VStack(spacing:30){
            
            TextField("Upload", text: $uploadText)
                .inputStyle(icon: "square.and.arrow.up")
                .focused($focusField, equals: .upload)
                .shadow(color:focusField == .upload ? .primary.opacity(0.3) : .clear, radius: 10 , x:0 , y:3)
            Button{
                
            }label: {
                Text("Submit")
                    .frame(maxWidth: .infinity)
            }
            .font(.headline)
            .buttonStyle(.angular)
            .tint(.accentColor)
            .controlSize(.large)
            .shadow(color: Color("Shadow").opacity(0.2),radius: 30,x: 0,y: 30)
                
        }
        .padding()
        .background(.ultraThinMaterial)
        .mask(RoundedRectangle(cornerRadius: 20, style: .continuous))
       // .padding(.bottom,20)
    }
}

#Preview {
    UploadItem()
}
