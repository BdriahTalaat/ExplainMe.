//
//  ProfileShape.swift
//  ExplainMe
//
//  Created by Bdriah Talaat on 03/05/1446 AH.
//

import SwiftUI

struct ProfileShape: View {
   
    @State var height: CGFloat
    @State var width: CGFloat
    
    var body: some View {
        ZStack(alignment: .bottom){
            ProfilePath()
                .frame(height: height * 0.8,alignment: .bottom)
                .shadow(color:Color.black.opacity(0.8),radius: 20,x:0,y: 10)
                .foregroundColor(Color("Background"))
        }

    }
}

#Preview {
    ProfileShape(height: 1000, width: 500)
}
struct ProfilePath: Shape {
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        
        // Start point at top left
        path.move(to: CGPoint(x: 0 * width / 390, y: 3.29376 * height / 603))
        
        // Upper curve segments (unchanged)
        path.addCurve(
            to: CGPoint(x: 135.5 * width / 390, y: 127.5 * height / 603),
            control1: CGPoint(x: -0.00174505 * width / 390, y: 58.4089 * height / 603),
            control2: CGPoint(x: 14.5 * width / 390, y: 117.05 * height / 603)
        )
        
        path.addCurve(
            to: CGPoint(x: 390 * width / 390, y: 245.593 * height / 603),
            control1: CGPoint(x: 256.5 * width / 390, y: 137.95 * height / 603),
            control2: CGPoint(x: 390 * width / 390, y: 109.187 * height / 603)
        )
        
        // Right vertical line
        path.addLine(to: CGPoint(x: 390 * width / 390, y: 543.087 * height / 603))
        
        // Replace curve on the bottom right corner with a line
        path.addLine(to: CGPoint(x: 390 * width / 390, y: 603 * height / 603))
        
        // Bottom horizontal line
        path.addLine(to: CGPoint(x: 0, y: 603 * height / 603))
        
        // Replace curve on the bottom left corner with a line
        path.addLine(to: CGPoint(x: 0, y: 543.004 * height / 603))
        
        // Left vertical curve to the starting point (unchanged)
        path.addCurve(
            to: CGPoint(x: 0 * width / 390, y: 3.29376 * height / 603),
            control1: CGPoint(x: 0.000531636 * width / 390, y: 382.526 * height / 603),
            control2: CGPoint(x: 0.00141835 * width / 390, y: -41.494 * height / 603)
        )
        
        return path
  
    }
}
