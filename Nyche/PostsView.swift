//
//  PostsView.swift
//  Nyche
//
//  Created by Zach on 7/21/20.
//

import Foundation
import SwiftUI

struct PostsView: View {
    
    @Binding var galleryIsFullscreen: Bool
    @Binding var imageInGallery: Image
    @State var showDateHeaders: Bool = true
    
    var body: some View {
            
        LazyVStack(alignment: .center, spacing: 32) {
            
            if showDateHeaders {
                
                VStack(alignment: .center, spacing: 8) {
                    
                    Image(systemName: "sun.max")
                        .font(.system(size: 34, weight: .bold))
                    
                    Text("Today")
                        .font(.system(.largeTitle, design: .rounded))
                        .bold()
                    
                }
                .padding(.top, 32)
                .padding(.horizontal, 32)
                
            }
            
            ImageTextPostCard(images: [PostImage(image: Image("Default")), PostImage(image: Image("Default"))], title: "Line work for my last portfolio piece", description: "Still a work in progress, but at least I can focus on colors instead of shapes.", tags: [Tag(string: "illustration"), Tag(string: "black & white"), Tag(string: "digital"), Tag(string: "portfolio")], user: User(username: "line-goblin", name: "Anna Kubernecky", profilePicture: Image("Default")), galleryIsFullscreen: $galleryIsFullscreen, imageInGallery: $imageInGallery)
            
            ImageTextPostCard(images: [PostImage(image: Image("Default")), PostImage(image: Image("Default"))], title: "Line work for my last portfolio piece", description: "Still a work in progress, but at least I can focus on colors instead of shapes.", tags: [Tag(string: "illustration"), Tag(string: "black & white"), Tag(string: "digital"), Tag(string: "portfolio")], user: User(username: "line-goblin", name: "Anna Kubernecky", profilePicture: Image("Default")), galleryIsFullscreen: $galleryIsFullscreen, imageInGallery: $imageInGallery)
            
            ImageTextPostCard(images: [PostImage(image: Image("Default")), PostImage(image: Image("Default"))], title: "Line work for my last portfolio piece", description: "Still a work in progress, but at least I can focus on colors instead of shapes.", tags: [Tag(string: "illustration"), Tag(string: "black & white"), Tag(string: "digital"), Tag(string: "portfolio")], user: User(username: "line-goblin", name: "Anna Kubernecky", profilePicture: Image("Default")), galleryIsFullscreen: $galleryIsFullscreen, imageInGallery: $imageInGallery)
            
            if showDateHeaders {
                
                Divider()
                
                VStack(alignment: .center, spacing: 8) {
                    
                    Image(systemName: "clock")
                        .font(.system(size: 34, weight: .bold))
                    
                    Text("Yesterday")
                        .font(.system(.largeTitle, design: .rounded))
                        .bold()
                    
                }
                .padding(.horizontal, 32)
                
            }
            
            ImageTextPostCard(images: [PostImage(image: Image("Default")), PostImage(image: Image("Default"))], title: "Line work for my last portfolio piece", description: "Still a work in progress, but at least I can focus on colors instead of shapes.", tags: [Tag(string: "illustration"), Tag(string: "black & white"), Tag(string: "digital"), Tag(string: "portfolio")], user: User(username: "line-goblin", name: "Anna Kubernecky", profilePicture: Image("Default")), galleryIsFullscreen: $galleryIsFullscreen, imageInGallery: $imageInGallery)
            
            if showDateHeaders {
                
                Divider()
                
                VStack(alignment: .center, spacing: 8) {
                    
                    Image(systemName: "calendar")
                        .font(.system(size: 34, weight: .bold))
                    
                    Text("Earlier this week")
                        .font(.system(.largeTitle, design: .rounded))
                        .bold()
                    
                }
                .padding(.horizontal, 32)
                
            }
            
            ImageTextPostCard(images: [PostImage(image: Image("Default")), PostImage(image: Image("Default"))], title: "Line work for my last portfolio piece", description: "Still a work in progress, but at least I can focus on colors instead of shapes.", tags: [Tag(string: "illustration"), Tag(string: "black & white"), Tag(string: "digital"), Tag(string: "portfolio")], user: User(username: "line-goblin", name: "Anna Kubernecky", profilePicture: Image("Default")), galleryIsFullscreen: $galleryIsFullscreen, imageInGallery: $imageInGallery)
            
        }
        .padding(.horizontal)
        .padding(.bottom, 100)
        .background(Color(UIColor.systemGroupedBackground))
        
    }
    
}

struct PostsView_Previews: PreviewProvider {
    static var previews: some View {
        PostsView(galleryIsFullscreen: .constant(false), imageInGallery: .constant(Image("Default")))
    }
}
