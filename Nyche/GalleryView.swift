//
//  GalleryView.swift
//  Nyche
//
//  Created by Zach on 9/4/20.
//

import SwiftUI

struct GalleryView: View {
    
    let images: [PostImage]
    let distanceToScreenEdge: Int
    
    @Environment(\.colorScheme) var colorScheme
    @Binding var galleryIsFullscreen: Bool
    @Binding var imageInGallery: Image
    
    var body: some View {
        
        TabView() {

            ForEach(images, id: \.id) { postImage in

                GeometryReader { geometry in

                    Rectangle()
                        .foregroundColor(.clear)
                        .background(
                            postImage.image
                                .resizable()
                                .scaledToFill()
                        )
                        .aspectRatio(1, contentMode: .fill)
                        .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                        .rotation3DEffect(Angle(
                            degrees:
                                Double(geometry.frame(in: .global).minX - CGFloat(distanceToScreenEdge)) / -20.0
                        ),
                        axis:
                            (x: 0, y: 1, z: 0)
                        )
                        .scaleEffect(
                            1 - abs(geometry.frame(in: .global).minX - CGFloat(distanceToScreenEdge)) * 0.0008
                        )

                }
                .aspectRatio(1, contentMode: .fill)

            }

        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
        .aspectRatio(1, contentMode: .fit)
        .background(Color(colorScheme == .light ? UIColor.secondarySystemBackground : UIColor.tertiarySystemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
        .onTapGesture {
            imageInGallery = self.images[0].image
            withAnimation(.easeInOut(duration: 0.15)) {
                galleryIsFullscreen = true
            }
        }
        
    }
    
}

struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView(
            images: [PostImage(image: Image("Default")), PostImage(image: Image("Default"))],
            distanceToScreenEdge: 0,
            galleryIsFullscreen: .constant(false),
            imageInGallery: .constant(Image(""))
        )
    }
}
