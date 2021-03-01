//
//  ImagePostCard.swift
//  Nyche
//
//  Created by Zach on 7/2/20.
//

import SwiftUI
import UIKit

struct ImageTextPostCard: View {
    
    // MARK: - Data
    
    let images: [PostImage]
    let title: String?
    let description: String?
    let tags: [Tag]
    let user: User
    
    // MARK: - States
    
    @Environment(\.colorScheme) var colorScheme
    @Binding var galleryIsFullscreen: Bool
    @Binding var imageInGallery: Image
    @State var isMini: Bool = false
    
    // MARK: - Body
    
    var body: some View {
        if isMini {
            VStack(alignment: .leading, spacing: 8) {
                images[0].image
                    .resizable()
                    .aspectRatio(1, contentMode: .fit)
                    .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                VStack(alignment: .leading, spacing: 2) {
                    Text(title ?? "")
                        .font(.system(.subheadline, design: .rounded))
                        .fontWeight(.bold)
                        .padding(.horizontal, 8)
                    Text("June 10, 1999")
                        .font(.system(.caption, design: .rounded))
                        .foregroundColor(.secondary)
                        .padding(.horizontal, 8)
                }
                .padding(.bottom, 4)
            }
            .padding(8)
            .background(Color(colorScheme == .light ? UIColor.systemBackground : UIColor.secondarySystemBackground))
            .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
            .overlay(RoundedRectangle(cornerRadius: 16, style: .continuous).stroke(Color(UIColor.separator), lineWidth: 0.5))
        } else {
            VStack(alignment: .leading, spacing: 24) {
                // TODO: Make this tab view a GalleryView
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
                                .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                                .rotation3DEffect(Angle(degrees:
                                    Double(geometry.frame(in: .global).minX - 20) / -20),
                                    axis: (x: 0, y: 1, z: 0)
                                )
                                .scaleEffect(
                                    1 - abs(geometry.frame(in: .global).minX - 20) * 0.0008
                                )
                        }
                        .aspectRatio(1, contentMode: .fill)
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                .aspectRatio(1, contentMode: .fit)
                .background(Color(colorScheme == .light ? UIColor.secondarySystemBackground : UIColor.tertiarySystemBackground))
                .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                .padding(.top, 8)
                .padding(.horizontal, 8)
                .onTapGesture {
                    imageInGallery = self.images[0].image
                    withAnimation(.spring()) {
                        galleryIsFullscreen = true
                    }
                }
                VStack(alignment: .leading, spacing: 12) {
                    Text(title ?? "")
                        .font(.system(.title3, design: .rounded))
                        .fontWeight(.bold)
                    Text(description ?? "")
                        .font(.system(.subheadline, design: .rounded))
                        .multilineTextAlignment(.leading)
                    Text("Friday August 28th, 2020 – 3:33 PM")
                        .font(.system(.caption, design: .rounded))
                        .foregroundColor(Color(UIColor.secondaryLabel))
                }
                .padding(.horizontal, 24)
                TagList(tags: tags, interactive: true)
                    .padding(.horizontal, 24)
                    .scaledToFit()
                PostFooter(user: .constant(user))
                    .padding(.horizontal, 8)
                    .padding(.bottom, 8)
            }
            .background(colorScheme == .light ? Color(UIColor.systemBackground) : Color(UIColor.secondarySystemBackground))
            .clipShape(RoundedRectangle(cornerRadius: 24, style: .continuous))
            .overlay(RoundedRectangle(cornerRadius: 24, style: .continuous).stroke(Color(UIColor.separator), lineWidth: 0.5))
            .shadow(radius: 16, y: 16)
        }
    }
}

// MARK: - Body Previews

struct ImageTextPostCard_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ImageTextPostCard(images: [PostImage(image: Image("Default")), PostImage(image: Image("Default"))], title: "Line work for my last portfolio piece", description: "Still a work in progress, but at least I can focus on colors instead of shapes.", tags: [Tag(string: "illustration"), Tag(string: "black & white"), Tag(string: "digital"), Tag(string: "portfolio")], user: User(username: "line-goblin", name: "Anna Kubernecky", profilePicture: Image("Default")), galleryIsFullscreen: .constant(false), imageInGallery: .constant(Image("Default")), isMini: false)
                .previewLayout(.sizeThatFits)
            ImageTextPostCard(images: [PostImage(image: Image("Default")), PostImage(image: Image("Default"))], title: "Line work for my last portfolio piece", description: "Still a work in progress, but at least I can focus on colors instead of shapes.", tags: [Tag(string: "illustration"), Tag(string: "black & white"), Tag(string: "digital"), Tag(string: "portfolio")], user: User(username: "line-goblin", name: "Anna Kubernecky", profilePicture: Image("Default")), galleryIsFullscreen: .constant(false), imageInGallery: .constant(Image("Default")), isMini: true)
                .previewLayout(.sizeThatFits)
            ImageTextPostCard(images: [PostImage(image: Image("Default")), PostImage(image: Image("Default"))], title: "Line work for my last portfolio piece", description: "Still a work in progress, but at least I can focus on colors instead of shapes.", tags: [Tag(string: "illustration"), Tag(string: "black & white"), Tag(string: "digital"), Tag(string: "portfolio")], user: User(username: "line-goblin", name: "Anna Kubernecky", profilePicture: Image("Default")), galleryIsFullscreen: .constant(false), imageInGallery: .constant(Image("Default")), isMini: false)             .preferredColorScheme(.dark)
                .previewLayout(.sizeThatFits)
        }
            
    }
}
