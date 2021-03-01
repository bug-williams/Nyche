//
//  ProfileView.swift
//  Nyche
//
//  Created by Zach on 7/27/20.
//

import Foundation
import SwiftUI

struct ProfileView: View {
    
    @Binding var galleryIsFullscreen: Bool
    @Binding var imageInGallery: Image
    @State var isSelfProfile: Bool = true
    
    let tags: [Tag]
    var nyches: [Nyche]
    private let imageHeight: CGFloat = UIScreen.main.bounds.size.width / 2
    
    private func getScrollOffset(_ geometry: GeometryProxy) -> CGFloat {
        geometry.frame(in: .global).minY
    }
    
    private func getOffsetForHeaderImage(_ geometry: GeometryProxy) -> CGFloat {
        let window = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
        let height = window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0
        
        let offset = getScrollOffset(geometry)
        let sizeOffScreen = imageHeight - height
        if offset < -sizeOffScreen {
            let imageOffset = abs(min(-sizeOffScreen, offset))
            return imageOffset - sizeOffScreen
        }
        // Image was pulled down
        if offset > 0 {
            return -offset
        }
        return 0
    }
    
    private func getHeightForHeaderImage(_ geometry: GeometryProxy) -> CGFloat {
        let offset = getScrollOffset(geometry)
        let imageHeight = geometry.size.height
        if offset > 0 {
            return imageHeight + offset
        }
        return imageHeight
    }
    
    private func getBlurOpacityForImage(_ geometry: GeometryProxy) -> Double {
        let offset = geometry.frame(in: .global).maxY
        let height = geometry.size.height
        let blur = (height - max(offset, 0)) / height // (values will range from 0 - 1)
        return Double(blur * 2)
    }
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 0) {
                // Image header
                GeometryReader { geometry in
                    Image("Default")
                        .resizable()
                        .scaledToFill()
                        .frame(width: geometry.size.width, height: self.getHeightForHeaderImage(geometry))
                        .overlay(
                            ThinBlurView()
                                .opacity(self.getBlurOpacityForImage(geometry))
                        )
                        .clipped()
                        .offset(x: 0, y: self.getOffsetForHeaderImage(geometry))
                }
                .frame(height: imageHeight)
                .zIndex(1)
                // Profile
                VStack(spacing: 0) {
                    ZStack {
                        Rectangle()
                            .foregroundColor(Color(UIColor.secondarySystemGroupedBackground))
                        VStack(spacing: 32) {
                            HStack(spacing: 16) {
                                Image("Default")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 80, height: 80)
                                    .clipShape(Circle())
                                VStack(alignment: .leading) {
                                    Text("Display Name")
                                        .font(.system(.title, design: .rounded))
                                        .bold()
                                        .lineLimit(1)
                                        .allowsTightening(true)
                                    Text("@username")
                                        .foregroundColor(Color(UIColor.secondaryLabel))
                                        .font(.system(.title2, design: .rounded))
                                }
                                Spacer()
                            }
                            TagList(tags: tags, interactive: false)
                            Text("This is an example of a bio. There will be multiple lines of text that a user can type in here. This can include tags that users will appear under if searched.")
                                .font(.system(.body, design: .rounded))
                                .foregroundColor(Color(UIColor.secondaryLabel))
                            if !isSelfProfile {
                                HStack(spacing: 8) {
                                    Button(action: {
                                        
                                    }, label: {
                                        HStack {
                                            Image(systemName: "plus")
                                            Text("Follow")
                                                .font(.system(.body, design: .rounded))
                                                .bold()
                                        }
                                        .frame(height: 48)
                                        .foregroundColor(.white)
                                        .padding(.horizontal, 16)
                                        .background(Color.accentColor)
                                        .cornerRadius(16)
                                    })
                                    Button(action: {
                                        
                                    }, label: {
                                        HStack {
                                            Image(systemName: "ellipsis")
                                        }
                                        .foregroundColor(.accentColor)
                                        .padding(.horizontal, 16)
                                        .frame(width: 48, height: 48)
                                        .background(Color(UIColor.tertiarySystemBackground))
                                        .cornerRadius(16)
                                    })
                                    Spacer()
                                }
                            }
                        }
                        .padding(32)
                    }
                    VStack(alignment: .leading, spacing: 32) {
                        HStack {
                            Text("Nyches")
                                .font(.system(.title, design: .rounded))
                                .bold()
                            Spacer()
                            Button(action: {
                                // TODO: View all button action.
                            }, label: {
                                HStack(spacing: 4) {
                                    Text("View All")
                                        .font(.system(.body, design: .rounded))
                                        .fontWeight(.semibold)
                                    Image(systemName: "chevron.right").font(.system(size: 16, weight: .semibold))
                                }
                            })
                        }
                        .padding(.horizontal, 32)
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 8) {
                                ForEach(nyches, id: \.id) { nyche in
                                    SmallNycheCard(data: nyche)
                                }
                            }
                            .padding(.horizontal, 16)
                            .padding(.vertical, 64)
                        }
                        .padding(.vertical, -64)
                        Divider()
                            .padding(.horizontal, 32)
                        Text("All Posts")
                            .font(.system(.title, design: .rounded))
                            .bold()
                            .padding(.horizontal, 32)
                        PostsView(galleryIsFullscreen: $galleryIsFullscreen, imageInGallery: $imageInGallery, showDateHeaders: false)
                    }
                    .padding(.top, 32)
                    .background(Color(UIColor.systemGroupedBackground))
                }
            }
        }
    }
    
}


// MARK: - Previews


struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(galleryIsFullscreen: .constant(false), imageInGallery: .constant(Image("Default")), tags: [Tag(string: "21"), Tag(string: "they/them"), Tag(string: "bisexual")], nyches: [Nyche(title: "Gothic Art", description: "A collection of my favorite pieces of gothic art.", image: Image("Default")), Nyche(title: "Gothic Art", description: "A collection of my favorite pieces of gothic art.", image: Image("Default")), Nyche(title: "Gothic Art", description: "A collection of my favorite pieces of gothic art.", image: Image("Default"))])
    }
}
