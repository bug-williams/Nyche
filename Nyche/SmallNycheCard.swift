//
//  SmallNycheCard.swift
//  Nyche
//
//  Created by Zach on 9/3/20.
//

import Foundation
import SwiftUI
import UIKit

struct SmallNycheCard: View {
    
    var data: Nyche
    
    var body: some View {
        
        ZStack {
            
            data.image
                .resizable()
                .scaledToFill()
                .frame(width: 150, height: 200)
            
            VStack(alignment: .leading) {
                
                Spacer()
                    
                HStack {
                    
                    Text(data.title)
                        .font(.system(.title3, design: .rounded))
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .shadow(radius: 8)
                        .padding(16)
                    
                    Spacer()
                    
                }
                
            }
            
        }
        .frame(minWidth: 100, idealWidth: 150, maxWidth: 200, minHeight: 200, idealHeight: 200, maxHeight: 200, alignment: .center)
        .clipped()
        .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
        .overlay(RoundedRectangle(cornerRadius: 16, style: .continuous).stroke(Color(UIColor.separator), lineWidth: 0.5))
        .shadow(radius: 16, y: 16)
        
    }
    
}

struct SmallNycheCard_Previews: PreviewProvider {
    static var previews: some View {
        SmallNycheCard(data: Nyche(title: "Gothic Art", description: "A collection of my favorite pieces of gothic art.", image: Image("Default")))
    }
}
