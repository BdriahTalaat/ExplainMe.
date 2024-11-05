//
//  LanguageModel.swift
//  ExplainMe
//
//  Created by Bdriah Talaat on 29/03/1446 AH.
//

import SwiftUI

enum LanguageModel: String, CaseIterable, Identifiable{
    //let id = UUID()
    case arabic
    case english
    var id: String { rawValue }
}
