//
//  ShareData.swift
//  ExplainMe
//
//  Created by Bdriah Talaat on 03/04/1446 AH.
//

import Foundation
import AVKit
import SwiftUI

class SharedData: ObservableObject{
    @Published var message:[String] = []
    @Published var title:String = ""
    @Published var videoID:String = ""
    @Published var textField:String = ""
    @Published var sound:URL?
    @Published var image:Data?
    @Published var pdf:URL?
    @Published var selectedLanguage:LanguageModel = .english
    @Published var appLaunguage:LanguageModel = .english
    @Published var mode:ColorScheme = .light
}
