//
//  Tab.swift
//  ExplainMe
//
//  Created by Bdriah Talaat on 23/03/1446 AH.
//

import SwiftUI

struct TabItem: Identifiable{
    var id = UUID()
    var text: String
    var icon: String
    var tab: Tab
    var color: String
    
}


var tabItems = [
    TabItem(text: "Home", icon: "house", tab: .home, color: "Yellow"),
    TabItem(text: "Profile", icon: "person", tab: .profile, color: "Pink"),
    TabItem(text: "Projects", icon: "books.vertical", tab: .projects, color: "Blue")
]

enum Tab:String {
    case home
    case profile
    case projects
}

struct TabPreferenceKey: PreferenceKey{
    static var defaultValue: CGFloat = 0
    
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}
