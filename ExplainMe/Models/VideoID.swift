//
//  VideoID.swift
//  ExplainMe
//
//  Created by Bdriah Talaat on 29/03/1446 AH.
//

import Foundation

func getVideoID(from url: String) -> String? {
    let patterns = [
        "https?://(?:www\\.)?youtube\\.com/watch\\?v=([^&]+)", // Standard URL
        "https?://(?:www\\.)?youtube\\.com/embed/([^?]+)",    // Embedded URL
        "https?://youtu\\.be/([^?]+)"                          // Short URL
    ]
    
    for pattern in patterns {
        if let regex = try? NSRegularExpression(pattern: pattern, options: []) {
            let nsString = url as NSString
            let results = regex.matches(in: url, options: [], range: NSRange(location: 0, length: nsString.length))
            if let match = results.first {
                return nsString.substring(with: match.range(at: 1))
            }
        }
    }
    
    return nil
}

