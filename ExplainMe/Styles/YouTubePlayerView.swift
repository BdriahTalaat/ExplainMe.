//
//  YouTubePlayerView.swift
//  ExplainMe
//
//  Created by Bdriah Talaat on 29/03/1446 AH.
//

import SwiftUI
import WebKit


struct YouTubePlayerView: View {
    let videoID: String

    var body: some View {
        if let url = URL(string: "https://www.youtube.com/embed/\(videoID)") {
            WebView(url: url)
                .frame(height: 300) // Set desired height for the video player
        } else {
            Text("Invalid Video ID")
        }
        
    }
}

struct WebView: UIViewRepresentable {
    let url: URL

    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        uiView.load(request)
    }
}
