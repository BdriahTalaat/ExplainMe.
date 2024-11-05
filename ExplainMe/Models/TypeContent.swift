//
//  TypeContent.swift
//  ExplainMe
//
//  Created by Bdriah Talaat on 21/03/1446 AH.
//

import SwiftUI

struct TypeContent: Identifiable{
    let id = UUID()
    var type:String
    var descripe:String
    var image:String
}

var contentType = [
    TypeContent(type: "Upload Sound", descripe: "Allows users to upload audio files,voice recordings, podcasts, or any other sound content. Supported file formats may include MP3, WAV, and AAC.", image: "Sound"),
    TypeContent(type: "Upload PDF", descripe: "Enables to upload PDF documents, which can include reports, e-books, articles, or any text-based content. ", image: "PDF"),
    TypeContent(type: "Upload Image", descripe: "Can upload image files, allowing them to share photos, graphics, or illustrations. Supported formats typically include JPEG, PNG, and GIF, making it easy to display visual content.", image: "Image"),
    TypeContent(type: "YouTube Link", descripe: " Allows users to input a URL from YouTube, facilitating the sharing of video content directly from the platform. ", image: "Youtube")
]

