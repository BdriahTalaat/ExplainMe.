//
//  FeatureCourse.swift
//  ExplainMe
//
//  Created by Bdriah Talaat on 04/04/1446 AH.
//

import SwiftUI

struct FeatureCourse: Identifiable {
    let id = UUID()
    var image:String
    var name:String
    var background:String
}

var featureCourse = [
    FeatureCourse(image: "Quiz", name: "Quiz", background: "background 3"),
    FeatureCourse(image: "Assistant", name: "Smart Asistant", background: "background 3"),
    FeatureCourse(image: "Summary", name: "Summary", background: "background 3"),
]
