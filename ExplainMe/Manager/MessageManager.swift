//
//  NessageManager.swift
//  ExplainMe
//
//  Created by Bdriah Talaat on 24/04/1446 AH.
//

import Foundation

class MessageManager: ObservableObject{
    @Published var message: [Message] = []
    
    func sendMessage (text:String){
        do{
            let newMessage = Message(message: text, recived: false)
        }catch{
            
        }
    }
}
