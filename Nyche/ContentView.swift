//
//  ContentView.swift
//  Nyche
//
//  Created by Zach on 6/29/20.
//

import SwiftUI
import ImageViewer


// MARK: - Main View


struct ContentView: View {
    
    @State var activeTab = 1
    @State var previousActiveTab = 1
    
    // Gallery states
    @State var galleryIsFullscreen: Bool = false
    @State var imageInGallery: Image = Image("Default")
    
    var body: some View {
        ZStack {
            switch activeTab {
            case 1:
                ScrollView {
                    PostsView(galleryIsFullscreen: $galleryIsFullscreen, imageInGallery: $imageInGallery)
                }
            case 2:
                SavedView(
                    galleryIsFullscreen: $galleryIsFullscreen,
                    imageInGallery: $imageInGallery
                )
            case 3:
                ProfileView(
                    galleryIsFullscreen: $galleryIsFullscreen,
                    imageInGallery: $imageInGallery,
                    isSelfProfile: true,
                    tags: [Tag(string: "21"), Tag(string: "they/them"), Tag(string: "bisexual"), Tag(string: "trans"), Tag(string: "polyamarous")],
                    nyches: [
                        Nyche(title: "line art", description: "The cleanest lines ONLY.", image: Image("Default")),
                        Nyche(title: "comics", description: "", image: Image("Default")),
                        Nyche(title: "misc", description: "cool stuff i guess", image: Image("Default"))
                    ])
            default:
                Text("Error loading content.")
            }
            TabBar(activeTab: $activeTab, previousActiveTab: $previousActiveTab)
            StatusBarBackground()
                .opacity(activeTab == 3 ? 0 : 1)
            
            // Fullscreen views
            
            ImageViewer(image: $imageInGallery, viewerShown: $galleryIsFullscreen)
        }
    }
    
}


// MARK: - Subviews


struct StatusBarBackground: View {
    
    var body: some View {
        VStack(spacing: 0) {
            Color(UIColor.systemGroupedBackground)
                .edgesIgnoringSafeArea(.all)
                .frame(height: 0)
            Divider()
            Spacer()
        }
    }
    
}


struct TabBar: View {
    
    @Environment(\.colorScheme) var colorScheme
    @Binding var activeTab: Int
    @Binding var previousActiveTab: Int
    
    var body: some View {
        ZStack {
            // Tab bar background
            GeometryReader { geometry in
                VStack {
                    Spacer()
                    Rectangle()
                        .frame(height: geometry.safeAreaInsets.top + 30)
                        .foregroundColor(.clear)
                }
            }
            .edgesIgnoringSafeArea(.bottom)
            // Tab bar
            VStack {
                Spacer()
                HStack {
                    ZStack() {
                        BlurView()
                        HStack(spacing: 4) {
                            ZStack {
                                Rectangle()
                                    .frame(height: 56)
                                    .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                                    .foregroundColor(Color(UIColor.label.withAlphaComponent(0.05)))
                                Rectangle()
                                    .frame(height: 56)
                                    .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                                    .foregroundColor(.accentColor)
                                    .opacity(activeTab == 1 ? 1 : 0)
                                Button(action: {
                                    previousActiveTab = activeTab
                                    activeTab = 1
                                    print("Switched to tab 1")
                                }) {
                                    Image(systemName: "rectangle.fill.on.rectangle.angled.fill")
                                        .foregroundColor(activeTab == 1 ? .white : Color(UIColor.secondaryLabel))
                                        .font(.headline)
                                    Text("Posts")
                                        .font(.system(.headline, design: .rounded))
                                        .foregroundColor(activeTab == 1 ? .white : Color(UIColor.secondaryLabel))
                                }
                            }
                            ZStack {
                                Rectangle()
                                    .frame(height: 56)
                                    .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                                    .foregroundColor(Color(UIColor.label.withAlphaComponent(0.05)))
                                Rectangle()
                                    .frame(height: 56)
                                    .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                                    .foregroundColor(.accentColor)
                                    .opacity(activeTab == 2 ? 1 : 0)
                                Button(action: {
                                    previousActiveTab = activeTab
                                    activeTab = 2
                                    print("Switched to tab 2")
                                }) {
                                    Image(systemName: "bookmark.fill")
                                        .foregroundColor(activeTab == 2 ? .white : Color(UIColor.secondaryLabel))
                                        .font(.headline)
                                    Text("Saved")
                                        .font(.system(.headline, design: .rounded))
                                        .foregroundColor(activeTab == 2 ? .white : Color(UIColor.secondaryLabel))
                                }
                            }
                            ZStack {
                                Rectangle()
                                    .frame(height: 56)
                                    .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                                    .foregroundColor(Color(UIColor.label.withAlphaComponent(0.05)))
                                Rectangle()
                                    .frame(height: 56)
                                    .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                                    .foregroundColor(.accentColor)
                                    .opacity(activeTab == 3 ? 1 : 0)
                                Button(action: {
                                    previousActiveTab = activeTab
                                    activeTab = 3
                                    print("Switched to tab 3")
                                }) {
                                    Image(systemName: "person.fill")
                                        .foregroundColor(activeTab == 3 ? .white : Color(UIColor.secondaryLabel))
                                        .font(.headline)
                                    Text("Profile")
                                        .font(.system(.headline, design: .rounded))
                                        .foregroundColor(activeTab == 3 ? .white : Color(UIColor.secondaryLabel))
                                }
                            }
                        }
                        .clipShape(RoundedRectangle(cornerRadius: 28, style: .continuous))
                        .padding(.horizontal, 4)
                    }
                    .frame(height: 64)
                    .clipShape(RoundedRectangle(cornerRadius: 32, style: .continuous))
                    .overlay(RoundedRectangle(cornerRadius: 32, style: .continuous).stroke(Color(UIColor.separator), lineWidth: 0.5))
                    .shadow(radius: 16, y: 16)
                    .padding(8)
                }
            }
        }
        
    }
    
    
    // MARK: - Previews
    
    
    struct ContentView_Previews: PreviewProvider {
        
        static var previews: some View {
            ContentView()
        }
        
    }
}
