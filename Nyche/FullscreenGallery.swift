//
//  FullscreenGallery.swift
//  Nyche
//
//  Created by Zach on 8/30/20.
//

import Foundation
import SwiftUI

struct FullscreenGallery: View {
    
    @Environment(\.colorScheme) var colorScheme
    @Binding var galleryIsFullscreen: Bool
    @Binding var postImage: PostImage
    
    @State var scale: CGFloat = 1.0
    @State var isTapped: Bool = false
    @State var pointTapped: CGPoint = CGPoint.zero
    @State var draggedSize: CGSize = CGSize.zero
    @State var previousDragged: CGSize = CGSize.zero
    
    var body: some View {
        ZStack {
            BlurView()
                .ignoresSafeArea()
            GeometryReader { geometry in
                VStack {
                    Spacer()
                    postImage.image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                        .padding(8)
                        .animation(.interactiveSpring())
                        .offset(x: self.draggedSize.width, y: 0)
                        .scaleEffect(self.scale)
                        .scaleEffect(self.isTapped ? 2 : 1,
                         anchor: UnitPoint(
                          x: self.pointTapped.x / geometry.frame(in: .global).maxX,
                          y: self.pointTapped.y / geometry.frame(in: .global).maxY
                          ))
                         .gesture(TapGesture(count: 2)
                         .onEnded({
                            self.isTapped = !self.isTapped
                         })
                        .simultaneously(with: DragGesture(minimumDistance: 0, coordinateSpace: .global)
                        .onChanged({ (value) in
                            self.pointTapped = value.startLocation
                            self.draggedSize = CGSize(
                                 width: value.translation.width + self.previousDragged.width,
                                 height: value.translation.height + self.previousDragged.height)
                        }).onEnded({ (value) in
                            let globalMaxX = geometry.frame(in: .global).maxX
                            let offsetWidth = ((globalMaxX * self.scale) - globalMaxX) / 2
                            let newDraggedWidth = self.draggedSize.width * self.scale
                            if (newDraggedWidth > offsetWidth) {
                                self.draggedSize = CGSize(
                                    width: offsetWidth / self.scale,
                                    height: value.translation.height + self.previousDragged.height
                                    )
                            } else if (newDraggedWidth < -offsetWidth) {
                                self.draggedSize = CGSize(
                                    width: -offsetWidth / self.scale,
                                    height: value.translation.height + self.previousDragged.height
                                    )
                            } else {
                                self.draggedSize = CGSize(
                                    width: value.translation.width + self.previousDragged.width,
                                    height: value.translation.height + self.previousDragged.height
                                    )
                            }
                            self.previousDragged = self.draggedSize
                            }))).gesture(MagnificationGesture()
                            .onChanged({ (scale) in
                            self.scale = scale.magnitude
                        }).onEnded({ (scaleFinal) in
                            self.scale = scaleFinal.magnitude
                        }))
                    Spacer()
                }
                .ignoresSafeArea()
                .clipShape(Rectangle())
                .rotation3DEffect(Angle(degrees:
                    Double(geometry.frame(in: .global).minX) / -20),
                    axis: (x: 0, y: 1, z: 0)
                )
                .scaleEffect(
                    1 - abs(geometry.frame(in: .global).minX) * 0.0008
                )
            }
            VStack {
                HStack() {
                    Spacer()
                    Button(action: {
                        withAnimation(.easeInOut(duration: 0.15)) {
                            galleryIsFullscreen = false
                        }
                    }, label: {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(.accentColor)
                            .font(.largeTitle)
                    })
                }
                .padding(20)
                Spacer()
            }
        }
        .background(Color(.clear))
        .opacity(galleryIsFullscreen ? 1 : 0)
    }
}

struct FullscreenGallery_Previews: PreviewProvider {
    static var previews: some View {
        FullscreenGallery(galleryIsFullscreen: .constant(true), postImage: .constant(PostImage(image: Image("Default"))))
    }
}
