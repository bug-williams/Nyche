//
//  PostFooter.swift
//  Nyche
//
//  Created by Zach on 8/31/20.
//

import Foundation
import SwiftUI
import UIKit

struct PostFooter: View {
    
    @Environment(\.colorScheme) var colorScheme
    @Binding var user: User
    
    var body: some View {
        VStack(spacing: 8){
            HStack(spacing: 16) {
                user.profilePicture
                    .resizable()
                    .frame(width: 56, height: 56)
                    .clipShape(Circle())
                    .scaledToFit()
                    .padding(3)
                    .overlay(Circle().stroke(Color.accentColor, lineWidth: 2))
                VStack(alignment: .leading) {
                    Text(user.name ?? "<Name failed to load>")
                        .font(.system(.headline, design: .rounded))
                        .lineLimit(1)
                    Text(user.username)
                        .multilineTextAlignment(.leading)
                        .font(.system(.subheadline, design: .rounded))
                        .foregroundColor(Color(UIColor.secondaryLabel))
                }
                Spacer()
                Button(action: {
                    // "More" button action
                    print("Hello, world!")
                }) {
                    Image(systemName: "ellipsis.circle.fill")
                }
                .font(.system(.title, design: .rounded))
            }
            .padding(20)
            .background(colorScheme == .light ? Color(UIColor.secondarySystemBackground) : Color(UIColor.tertiarySystemBackground))
            .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
            HStack(spacing: 0) {
                Spacer()
                Button(action: {
                    print("Clipped!")
                }) {
                    Image(systemName: "paperclip")
                        .font(.system(size: 16, weight: .regular))
                    Text("Clip")
                        .font(.system(.body, design: .rounded))
                        .fontWeight(.regular)
                }
                .foregroundColor(.accentColor)
                Group {
                    Spacer()
                    Divider()
                        .padding(.vertical, 8)
                    Spacer()
                }
                Button(action: {
                    print("Saved!")
                }) {
                    Image(systemName: "bookmark")
                        .font(.system(size: 16, weight: .regular))
                    Text("Save")
                        .font(.system(.body, design: .rounded))
                        .fontWeight(.regular)
                }
                .foregroundColor(.accentColor)
                Group {
                    Spacer()
                    Divider()
                        .padding(.vertical, 8)
                    Spacer()
                }
                Button(action: {
                    print("Shared!")
                }) {
                    Image(systemName: "square.and.arrow.up")
                        .font(.system(size: 16, weight: .regular))
                    Text("Share")
                        .font(.system(.body, design: .rounded))
                        .fontWeight(.regular)
                }
                .foregroundColor(.accentColor)
                Spacer()
            }
            .frame(height: 48)
            .background(Color(colorScheme == .light ? UIColor.secondarySystemBackground : UIColor.tertiarySystemBackground))
            .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
            
        }
        
    }
    
}

struct PostFooter_Previews: PreviewProvider {
    static var previews: some View {
        PostFooter(user: .constant(User(username: "Username", name: "First Last", profilePicture: Image("Default"))))
    }
}
