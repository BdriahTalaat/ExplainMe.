//
//  Message.swift
//  ExplainMe
//
//  Created by Bdriah Talaat on 24/04/1446 AH.
//

import Foundation

struct Message:Identifiable, Codable{
    var id = UUID()
    var message : String
    var recived: Bool
}
