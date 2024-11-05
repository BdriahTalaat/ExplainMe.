//
//  FeatureCourseItem.swift
//  ExplainMe
//
//  Created by Bdriah Talaat on 04/04/1446 AH.
//

import SwiftUI

struct FeatureCourseItem: View {
    
    var feature:FeatureCourse = featureCourse[0]
    var nameSpace : Namespace.ID
    @Binding var show:Bool
    
    var body: some View {
        VStack {
           
            Spacer()
            
            VStack (alignment: .leading,spacing:10 ){
                Text(feature.name)
                    .font(.title.weight(.bold))
                    .matchedGeometryEffect(id: "title\(feature.id)", in: nameSpace)
                    .frame(maxWidth: .infinity)

            }
            .padding(20)
            .background(
                Rectangle()
                    .fill(.ultraThinMaterial)
                    .mask({
                        RoundedRectangle(cornerRadius: 30, style: .continuous)
                    })
                    .blur(radius: 20)
                    .matchedGeometryEffect(id: "blur\(feature.id)", in: nameSpace)
            )
                
        }
        .foregroundStyle(.white)
        .frame(maxWidth: .infinity)
        .background(
            
            Image(feature.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(20)
                .matchedGeometryEffect(id: "image\(feature.id)", in: nameSpace)
        )
        .background(
            Image(feature.background)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .matchedGeometryEffect(id: "background\(feature.id)", in: nameSpace)
        )
        
        .mask {
            RoundedRectangle(cornerRadius: 30, style: .continuous)
                .matchedGeometryEffect(id: "mask\(feature.id)", in: nameSpace)
        }
        .strokeStyle(cornerRadius: 30)
        .frame(height: 200)

    }
}

#Preview {
    @Previewable @Namespace var namespace
    FeatureCourseItem(nameSpace: namespace, show: .constant(true))
}
