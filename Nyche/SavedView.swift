//
//  SavedView.swift
//  Nyche
//
//  Created by Bug on 1/17/21.
//

import Foundation
import SwiftUI

struct SavedView: View {
    
    @Binding var galleryIsFullscreen: Bool
    @Binding var imageInGallery: Image
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading, spacing: 32) {
                    Text("Categories")
                        .font(.system(.title, design: .rounded))
                        .fontWeight(.bold)
                        .padding(.horizontal)
                    VStack(spacing: 8) {
                        NavigationLink(destination:
                            SavedCategoryView(
                                galleryIsFullscreen: $galleryIsFullscreen,
                                imageInGallery: $imageInGallery,
                                icon: Image(systemName: "heart.fill"),
                                title: "Favorites"
                            )
                        ) {
                            SavedCategoryRow(icon: Image(systemName: "heart.fill"), title: "Favorites")
                        }
                        .navigationBarTitle("")
                        .navigationBarTitleDisplayMode(.inline)
                        NavigationLink(destination: Text("Second View")) {
                            SavedCategoryRow(icon: Image(systemName: "perspective"), title: "Perspective drawings")
                        }
                        .navigationBarTitle("")
                        NavigationLink(destination: Text("Second View")) {
                            SavedCategoryRow(icon: Image(systemName: "gamecontroller.fill"), title: "Fanart")
                        }
                        .navigationBarTitle("")
                    }
                    Divider()
                        .padding(.horizontal)
                    Text("Recently Saved")
                        .font(.system(.title, design: .rounded))
                        .fontWeight(.bold)
                        .padding(.horizontal)
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
                    }
                    .clipped()
                    .shadow(radius: 16, y: 16)
                }
                .padding(.horizontal)
                .padding(.vertical, 32)
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
            .background(Color(UIColor.systemGroupedBackground))
        }
    }
    
}
