//
//  CheckURL.swift
//  ExplainMe
//
//  Created by Bdriah Talaat on 28/03/1446 AH.
//

import Foundation

func isYouTubeVideo(url: String) -> Bool {
    guard let url = URL(string: url) else { return false }
    
    // Check if the URL host is YouTube
    if url.host == "www.youtube.com" || url.host == "youtube.com" ||
       url.host == "m.youtube.com" || url.host == "www.youtu.be" ||
       url.host == "youtu.be" {
        return true
    }
    
    // Check for specific paths indicating a video
    if url.pathComponents.contains("watch") || url.pathComponents.contains("embed") {
        return true
    }
    
    return false
}

