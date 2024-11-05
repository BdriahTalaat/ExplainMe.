//
//  MessageBubble.swift
//  ExplainMe
//
//  Created by Bdriah Talaat on 24/04/1446 AH.
//

import SwiftUI

struct MessageBubble: View {
    var message:Message
    
    var body: some View {
        VStack(alignment: message.recived ? .leading : .trailing) {
            
            HStack {
                Text(message.message)
                    .padding()
                    .background(message.recived ? Color.gray.opacity(0.5) : Color("Pink"))
                    .cornerRadius(20)
            }
            .frame(maxWidth: 300 , alignment: message.recived ? .leading : .trailing)
        }
        .frame(maxWidth: .infinity , alignment: message.recived ? .leading : .trailing)
        .padding(message.recived ? .leading : .trailing)
        .padding(.horizontal,10)
    }
}

#Preview {
    MessageBubble(message: Message(message: "# returns the index of the first instance of the string inside the # subject string, otherwise -1 my_string.find('l')", recived: false))
}
