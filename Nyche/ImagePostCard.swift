//
//  ImagePostCard.swift
//  Nyche
//
//  Created by Zach on 7/10/20.
//

import SwiftUI

struct ImagePostCard: View {
    
    var images: [Image]

    @State private var imageIsBlurred: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Hello world!")
        }
        .background(Color(UIColor.systemBackground))
        .cornerRadius(20)
        .padding(.horizontal, 20)
        .shadow(radius: 20, x: 0, y: 10)
    }
}

struct ImagePostCard_Previews: PreviewProvider {
    static var previews: some View {
        ImagePostCard(images: [Image("Default")])
    }
}
