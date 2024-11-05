//
//  PlayView.swift
//  ExplainMe
//
//  Created by Bdriah Talaat on 04/04/1446 AH.
//

import SwiftUI

struct PlayView: View {
    
    @State var isPlay: Bool
    @State var height: CGFloat
    
    var body: some View {
        
        if isPlay{
           
            VStack {
                PlayShape()
                    .fill(Color("Shadow").opacity(0.8))
                    .overlay(PlayShape().stroke(.white))
                    .frame(width: height * 0.08,height: height * 0.08)
                    .background(
                        PlayShape()
                            .fill(.angularGradient(colors: [Color("Pink"),Color("Blue"),Color("Pink")], center: .center, startAngle: .degrees(0), endAngle: .degrees(360)))
                            .blur(radius: 12)
                    )
                    .offset(x: 2)
            }
            .frame(width:height * 0.3 ,height: height * 0.3)
            .background(.ultraThinMaterial,in: RoundedRectangle(cornerRadius: 55, style: .continuous))
            .cornerRadius(height/2)
            .strokeStyle(cornerRadius: height/2)
            .shadow(color: Color("Shadow").opacity(0.2),radius: 30,x: 0,y: 30)
            
            
                            
        }else{
            VStack {
                PauseShape()
                    .fill(Color("Shadow").opacity(0.8))
                    .overlay(PauseShape().stroke(.white))
                    .frame(width: height * 0.08,height: height * 0.08)
                    .background(
                        PauseShape()
                            .fill(.angularGradient(colors: [Color("Pink"),Color("Blue"),Color("Pink")], center: .center, startAngle: .degrees(0), endAngle: .degrees(360)))
                            .blur(radius: 12)
                    )
                    .offset(x: 4)
            }
            .frame(width:height * 0.3 ,height: height * 0.3)
            .background(.ultraThinMaterial,in: RoundedRectangle(cornerRadius: 55, style: .continuous))
            .cornerRadius(height/2)
            .strokeStyle(cornerRadius: height/2)
            .shadow(color: Color("Shadow").opacity(0.2),radius: 30,x: 0,y: 30)
        }
    }
}

#Preview {
    PlayView(isPlay: false,height: 700)
}


struct PlayShape: Shape {
   
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        
        path.move(to: CGPoint(x: 0.04718*width, y: 0.08831*height))
        path.addCurve(to: CGPoint(x: 0.01539*width, y: 0.18464*height), control1: CGPoint(x: 0.0284*width, y: 0.11157*height), control2: CGPoint(x: 0.01969*width, y: 0.14249*height))
        path.addCurve(to: CGPoint(x: 0.0111*width, y: 0.35395*height), control1: CGPoint(x: 0.0111*width, y: 0.22673*height), control2: CGPoint(x: 0.0111*width, y: 0.28167*height))
        path.addLine(to: CGPoint(x: 0.0111*width, y: 0.35451*height))
        path.addLine(to: CGPoint(x: 0.0111*width, y: 0.64549*height))
        path.addLine(to: CGPoint(x: 0.0111*width, y: 0.64605*height))
        path.addCurve(to: CGPoint(x: 0.01539*width, y: 0.81536*height), control1: CGPoint(x: 0.0111*width, y: 0.71834*height), control2: CGPoint(x: 0.0111*width, y: 0.77327*height))
        path.addCurve(to: CGPoint(x: 0.04718*width, y: 0.91169*height), control1: CGPoint(x: 0.01969*width, y: 0.85751*height), control2: CGPoint(x: 0.0284*width, y: 0.88844*height))
        path.addCurve(to: CGPoint(x: 0.18025*width, y: 0.98084*height), control1: CGPoint(x: 0.07864*width, y: 0.95067*height), control2: CGPoint(x: 0.12701*width, y: 0.9758*height))
        path.addCurve(to: CGPoint(x: 0.28883*width, y: 0.95745*height), control1: CGPoint(x: 0.21201*width, y: 0.98384*height), control2: CGPoint(x: 0.24613*width, y: 0.97517*height))
        path.addCurve(to: CGPoint(x: 0.45389*width, y: 0.87614*height), control1: CGPoint(x: 0.33148*width, y: 0.93975*height), control2: CGPoint(x: 0.38434*width, y: 0.91228*height))
        path.addLine(to: CGPoint(x: 0.45443*width, y: 0.87586*height))
        path.addLine(to: CGPoint(x: 0.73443*width, y: 0.73036*height))
        path.addLine(to: CGPoint(x: 0.73498*width, y: 0.73008*height))
        path.addCurve(to: CGPoint(x: 0.89575*width, y: 0.64208*height), control1: CGPoint(x: 0.80453*width, y: 0.69394*height), control2: CGPoint(x: 0.85739*width, y: 0.66647*height))
        path.addCurve(to: CGPoint(x: 0.97255*width, y: 0.56915*height), control1: CGPoint(x: 0.93415*width, y: 0.61766*height), control2: CGPoint(x: 0.95956*width, y: 0.59541*height))
        path.addCurve(to: CGPoint(x: 0.97255*width, y: 0.43086*height), control1: CGPoint(x: 0.99432*width, y: 0.52513*height), control2: CGPoint(x: 0.99432*width, y: 0.47487*height))
        path.addCurve(to: CGPoint(x: 0.89575*width, y: 0.35792*height), control1: CGPoint(x: 0.95956*width, y: 0.40459*height), control2: CGPoint(x: 0.93416*width, y: 0.38234*height))
        path.addCurve(to: CGPoint(x: 0.73498*width, y: 0.26992*height), control1: CGPoint(x: 0.85739*width, y: 0.33353*height), control2: CGPoint(x: 0.80453*width, y: 0.30606*height))
        path.addLine(to: CGPoint(x: 0.73444*width, y: 0.26964*height))
        path.addLine(to: CGPoint(x: 0.45444*width, y: 0.12415*height))
        path.addLine(to: CGPoint(x: 0.4539*width, y: 0.12387*height))
        path.addCurve(to: CGPoint(x: 0.28883*width, y: 0.04256*height), control1: CGPoint(x: 0.38434*width, y: 0.08773*height), control2: CGPoint(x: 0.33148*width, y: 0.06026*height))
        path.addCurve(to: CGPoint(x: 0.18025*width, y: 0.01916*height), control1: CGPoint(x: 0.24613*width, y: 0.02483*height), control2: CGPoint(x: 0.21201*width, y: 0.01616*height))
        path.addCurve(to: CGPoint(x: 0.04718*width, y: 0.08831*height), control1: CGPoint(x: 0.12701*width, y: 0.0242*height), control2: CGPoint(x: 0.07864*width, y: 0.04933*height))
        path.closeSubpath()
        path.move(to: CGPoint(x: 0.04718*width, y: 0.08831*height))
        path.addCurve(to: CGPoint(x: 0.01539*width, y: 0.18464*height), control1: CGPoint(x: 0.0284*width, y: 0.11157*height), control2: CGPoint(x: 0.01969*width, y: 0.14249*height))
        path.addCurve(to: CGPoint(x: 0.0111*width, y: 0.35395*height), control1: CGPoint(x: 0.0111*width, y: 0.22673*height), control2: CGPoint(x: 0.0111*width, y: 0.28167*height))
        path.addLine(to: CGPoint(x: 0.0111*width, y: 0.35451*height))
        path.addLine(to: CGPoint(x: 0.0111*width, y: 0.64549*height))
        path.addLine(to: CGPoint(x: 0.0111*width, y: 0.64605*height))
        path.addCurve(to: CGPoint(x: 0.01539*width, y: 0.81536*height), control1: CGPoint(x: 0.0111*width, y: 0.71834*height), control2: CGPoint(x: 0.0111*width, y: 0.77327*height))
        path.addCurve(to: CGPoint(x: 0.04718*width, y: 0.91169*height), control1: CGPoint(x: 0.01969*width, y: 0.85751*height), control2: CGPoint(x: 0.0284*width, y: 0.88844*height))
        path.addCurve(to: CGPoint(x: 0.18025*width, y: 0.98084*height), control1: CGPoint(x: 0.07864*width, y: 0.95067*height), control2: CGPoint(x: 0.12701*width, y: 0.9758*height))
        path.addCurve(to: CGPoint(x: 0.28883*width, y: 0.95745*height), control1: CGPoint(x: 0.21201*width, y: 0.98384*height), control2: CGPoint(x: 0.24613*width, y: 0.97517*height))
        path.addCurve(to: CGPoint(x: 0.45389*width, y: 0.87614*height), control1: CGPoint(x: 0.33148*width, y: 0.93975*height), control2: CGPoint(x: 0.38434*width, y: 0.91228*height))
        path.addLine(to: CGPoint(x: 0.45443*width, y: 0.87586*height))
        path.addLine(to: CGPoint(x: 0.73443*width, y: 0.73036*height))
        path.addLine(to: CGPoint(x: 0.73498*width, y: 0.73008*height))
        path.addCurve(to: CGPoint(x: 0.89575*width, y: 0.64208*height), control1: CGPoint(x: 0.80453*width, y: 0.69394*height), control2: CGPoint(x: 0.85739*width, y: 0.66647*height))
        path.addCurve(to: CGPoint(x: 0.97255*width, y: 0.56915*height), control1: CGPoint(x: 0.93415*width, y: 0.61766*height), control2: CGPoint(x: 0.95956*width, y: 0.59541*height))
        path.addCurve(to: CGPoint(x: 0.97255*width, y: 0.43086*height), control1: CGPoint(x: 0.99432*width, y: 0.52513*height), control2: CGPoint(x: 0.99432*width, y: 0.47487*height))
        path.addCurve(to: CGPoint(x: 0.89575*width, y: 0.35792*height), control1: CGPoint(x: 0.95956*width, y: 0.40459*height), control2: CGPoint(x: 0.93416*width, y: 0.38234*height))
        path.addCurve(to: CGPoint(x: 0.73498*width, y: 0.26992*height), control1: CGPoint(x: 0.85739*width, y: 0.33353*height), control2: CGPoint(x: 0.80453*width, y: 0.30606*height))
        path.addLine(to: CGPoint(x: 0.73444*width, y: 0.26964*height))
        path.addLine(to: CGPoint(x: 0.45444*width, y: 0.12415*height))
        path.addLine(to: CGPoint(x: 0.4539*width, y: 0.12387*height))
        path.addCurve(to: CGPoint(x: 0.28883*width, y: 0.04256*height), control1: CGPoint(x: 0.38434*width, y: 0.08773*height), control2: CGPoint(x: 0.33148*width, y: 0.06026*height))
        path.addCurve(to: CGPoint(x: 0.18025*width, y: 0.01916*height), control1: CGPoint(x: 0.24613*width, y: 0.02483*height), control2: CGPoint(x: 0.21201*width, y: 0.01616*height))
        path.addCurve(to: CGPoint(x: 0.04718*width, y: 0.08831*height), control1: CGPoint(x: 0.12701*width, y: 0.0242*height), control2: CGPoint(x: 0.07864*width, y: 0.04933*height))
        path.closeSubpath()
        return path
    }
}

struct PauseShape: Shape {

    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        
        
        path.move(to: CGPoint(x: 4.2326 * width / 37, y: 52 * height / 52))
        path.addCurve(to: CGPoint(x: 0 * width / 37, y: 47.508 * height / 52),
                      control1: CGPoint(x: 1.4015 * width / 37, y: 52 * height / 52),
                      control2: CGPoint(x: 0 * width / 37, y: 50.4828 * height / 52))
        path.addLine(to: CGPoint(x: 0 * width / 37, y: 4.4622 * height / 52))
        path.addCurve(to: CGPoint(x: 4.2326 * width / 37, y: 0 * height / 52),
                      control1: CGPoint(x: 0 * width / 37, y: 1.5172 * height / 52),
                      control2: CGPoint(x: 1.4296 * width / 37, y: 0 * height / 52))
        path.addLine(to: CGPoint(x: 10.9318 * width / 37, y: 0 * height / 52))
        path.addCurve(to: CGPoint(x: 15.1364 * width / 37, y: 4.4622 * height / 52),
                      control1: CGPoint(x: 13.7068 * width / 37, y: 0 * height / 52),
                      control2: CGPoint(x: 15.1364 * width / 37, y: 1.4577 * height / 52))
        path.addLine(to: CGPoint(x: 15.1364 * width / 37, y: 47.508 * height / 52))
        path.addCurve(to: CGPoint(x: 10.9318 * width / 37, y: 52 * height / 52),
                      control1: CGPoint(x: 15.1364 * width / 37, y: 50.4828 * height / 52),
                      control2: CGPoint(x: 13.7068 * width / 37, y: 52 * height / 52))
        path.addLine(to: CGPoint(x: 4.2326 * width / 37, y: 52 * height / 52))
        path.closeSubpath()
        
        path.move(to: CGPoint(x: 26.0682 * width / 37, y: 52 * height / 52))
        path.addCurve(to: CGPoint(x: 21.8636 * width / 37, y: 47.508 * height / 52),
                      control1: CGPoint(x: 23.2371 * width / 37, y: 52 * height / 52),
                      control2: CGPoint(x: 21.8636 * width / 37, y: 50.4828 * height / 52))
        path.addLine(to: CGPoint(x: 21.8636 * width / 37, y: 4.4622 * height / 52))
        path.addCurve(to: CGPoint(x: 26.0682 * width / 37, y: 0 * height / 52),
                      control1: CGPoint(x: 21.8636 * width / 37, y: 1.5172 * height / 52),
                      control2: CGPoint(x: 23.2932 * width / 37, y: 0 * height / 52))
        path.addLine(to: CGPoint(x: 32.7674 * width / 37, y: 0 * height / 52))
        path.addCurve(to: CGPoint(x: 37 * width / 37, y: 4.4622 * height / 52),
                      control1: CGPoint(x: 35.5705 * width / 37, y: 0 * height / 52),
                      control2: CGPoint(x: 37 * width / 37, y: 1.4577 * height / 52))
        path.addLine(to: CGPoint(x: 37 * width / 37, y: 47.508 * height / 52))
        path.addCurve(to: CGPoint(x: 32.7674 * width / 37, y: 52 * height / 52),
                      control1: CGPoint(x: 37 * width / 37, y: 50.4828 * height / 52),
                      control2: CGPoint(x: 35.5705 * width / 37, y: 52 * height / 52))
        path.addLine(to: CGPoint(x: 26.0682 * width / 37, y: 52 * height / 52))
        path.closeSubpath()
        
        return path
    }
}

