//
//  SignUpView.swift
//  ExplainMe
//
//  Created by Bdriah Talaat on 19/03/1446 AH.
//

import SwiftUI

struct SignUpView: View {
    enum Field:Hashable{
        case email
        case password
        case username
    }
    
    @State var email = ""
    @State var password = ""
    @State var username = ""
    @FocusState var focusField:Field?
    
    var body: some View {
        ZStack {
            
            VStack(alignment:.leading, spacing:16){
                Text("Sign Up")
                    .font(.largeTitle.bold())
                
                Text("Create new account")
                    .font(.headline)
                
                TextField("User name", text: $username)
                    .inputStyle(icon: "person")
                    .textContentType(.username)
                    .focused($focusField, equals: .username)
                    .shadow(color:focusField == .username ? .primary.opacity(0.3) : .clear, radius: 10 , x:0 , y:3)
                
                TextField("Email", text: $email)
                    .inputStyle(icon: "mail")
                    .keyboardType(.emailAddress)
                    .textContentType(.emailAddress)
                    .focused($focusField, equals: .email)
                    .shadow(color:focusField == .email ? .primary.opacity(0.3) : .clear, radius: 10 , x:0 , y:3)
                
                TextField("Password", text: $password)
                    .inputStyle(icon: "lock")
                    .textContentType(.password)
                    .focused($focusField, equals: .password)
                    .shadow(color:focusField == .password ? .primary.opacity(0.3) : .clear, radius: 10 , x:0 , y:3)
                
                Button{
                    
                }label: {
                    Text("Create Account")
                        .frame(maxWidth: .infinity)
                }
                .font(.headline)
                .buttonStyle(.angular)
                .tint(.accentColor)
                .controlSize(.large)
                .shadow(color: Color("Shadow").opacity(0.2),radius: 30,x: 0,y: 30)
                
                Group {
                    Text("By clicking on ")
                    + Text("_Create an account_").foregroundColor(.primary.opacity(0.7))
                    + Text(", you agree to our **Terms of service**.")
                    
                    Divider()
                    
                    HStack {
                        Text("Already have an account?")
                        
                        Button{
                            //  model.selectedModel = .signIn
                        } label:{
                            Text("**Sign in**")
                        }
                    }
                    
                }
                
                
            }
            .padding(20)
            .background(.ultraThinMaterial,in: RoundedRectangle(cornerRadius: 20, style: .continuous))
            .padding()
            .frame(maxWidth: .infinity)
            

        }
        .background(
            Image("Blob")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 700)
                .offset(x:200,y:-180)
        )
        .frame(maxWidth:.infinity, maxHeight: .infinity)
        .background(
            Color("Background")
        )
      
    }
}

#Preview {
    SignUpView()
}
