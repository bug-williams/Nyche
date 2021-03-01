//
//  SavedCategoryView.swift
//  Nyche
//
//  Created by Bug on 2/12/21.
//

import Foundation
import SwiftUI

struct SavedCategoryView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @Binding var galleryIsFullscreen: Bool
    @Binding var imageInGallery: Image
    
    let icon: Image
    let title: String
    
    var body: some View {
        ZStack {
            ScrollView(showsIndicators: false) {
                VStack(spacing: 32) {
                    VStack(alignment: .center, spacing: 8) {
                        icon
                            .font(.system(size: 34, weight: .bold))
                        Text(title)
                            .font(.system(.largeTitle, design: .rounded))
                            .bold()
                    }
                    .padding(.horizontal, 32)
                    LazyVGrid(columns: [GridItem(.flexible(), spacing: 8), GridItem(.flexible())], spacing: 8) {
                        ImageTextPostCard(
                            images: [PostImage(image: Image("Default")), PostImage(image: Image("Default"))],
                            title: "Great Canyon",
                            description: "Took this photo in the great canyon last spring!",
                            tags: [Tag(string: "photo")],
                            user: User(username: "zoozle", name: "Bug", profilePicture: Image("Default")),
                            galleryIsFullscreen: $galleryIsFullscreen,
                            imageInGallery: $imageInGallery,
                            isMini: true
                        )
                        ImageTextPostCard(
                            images: [PostImage(image: Image("Default")), PostImage(image: Image("Default"))],
                            title: "Great Canyon",
                            description: "Took this photo in the great canyon last spring!",
                            tags: [Tag(string: "photo")],
                            user: User(username: "zoozle", name: "Bug", profilePicture: Image("Default")),
                            galleryIsFullscreen: $galleryIsFullscreen,
                            imageInGallery: $imageInGallery,
                            isMini: true
                        )
                        ImageTextPostCard(
                            images: [PostImage(image: Image("Default")), PostImage(image: Image("Default"))],
                            title: "Great Canyon",
                            description: "Took this photo in the great canyon last spring!",
                            tags: [Tag(string: "photo")],
                            user: User(username: "zoozle", name: "Bug", profilePicture: Image("Default")),
                            galleryIsFullscreen: $galleryIsFullscreen,
                            imageInGallery: $imageInGallery,
                            isMini: true
                        )
                        ImageTextPostCard(
                            images: [PostImage(image: Image("Default")), PostImage(image: Image("Default"))],
                            title: "Great Canyon",
                            description: "Took this photo in the great canyon last spring!",
                            tags: [Tag(string: "photo")],
                            user: User(username: "zoozle", name: "Bug", profilePicture: Image("Default")),
                            galleryIsFullscreen: $galleryIsFullscreen,
                            imageInGallery: $imageInGallery,
                            isMini: true
                        )
                        ImageTextPostCard(
                            images: [PostImage(image: Image("Default")), PostImage(image: Image("Default"))],
                            title: "Great Canyon",
                            description: "Took this photo in the great canyon last spring!",
                            tags: [Tag(string: "photo")],
                            user: User(username: "zoozle", name: "Bug", profilePicture: Image("Default")),
                            galleryIsFullscreen: $galleryIsFullscreen,
                            imageInGallery: $imageInGallery,
                            isMini: true
                        )
                        ImageTextPostCard(
                            images: [PostImage(image: Image("Default")), PostImage(image: Image("Default"))],
                            title: "Great Canyon",
                            description: "Took this photo in the great canyon last spring!",
                            tags: [Tag(string: "photo")],
                            user: User(username: "zoozle", name: "Bug", profilePicture: Image("Default")),
                            galleryIsFullscreen: $galleryIsFullscreen,
                            imageInGallery: $imageInGallery,
                            isMini: true
                        )
                        ImageTextPostCard(
                            images: [PostImage(image: Image("Default")), PostImage(image: Image("Default"))],
                            title: "Great Canyon",
                            description: "Took this photo in the great canyon last spring!",
                            tags: [Tag(string: "photo")],
                            user: User(username: "zoozle", name: "Bug", profilePicture: Image("Default")),
                            galleryIsFullscreen: $galleryIsFullscreen,
                            imageInGallery: $imageInGallery,
                            isMini: true
                        )
                    }
                    .clipped()
                    .shadow(radius: 16, y: 16)
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 32)
                .padding(.top, 48 + 16)
            }
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(false)
            .background(Color(UIColor.systemGroupedBackground))
            VStack {
                HStack {
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }, label: {
                        ZStack {
                            BlurView()
                                .clipShape(Circle())
                                .shadow(radius: 16, y: 16)
                                .overlay(Circle().stroke(Color(UIColor.separator), lineWidth: 0.5))
                            Image(systemName: "chevron.backward").font(.system(size: 16, weight: .bold))
                        }
                    })
                    .frame(width: 48, height: 48)
                    .padding()
                    Spacer()
                }
                .padding()
                Spacer()
            }
        }
    }
    
}

struct SavedCategoryView_Previews: PreviewProvider {
    static var previews: some View {
        SavedCategoryView(
            galleryIsFullscreen: .constant(false),
            imageInGallery: .constant(Image("Default")),
            icon: Image(systemName: "heart.fill"),
            title: "Favorites"
        )
    }
}
