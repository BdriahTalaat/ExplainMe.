//
//  PreferenceKeys.swift
//  ExplainMe
//
//  Created by Bdriah Talaat on 23/03/1446 AH.
//

import SwiftUI

struct ScrollPreferenceKey: PreferenceKey{
    
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}
