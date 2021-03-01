//
//  SavedCategoryRow.swift
//  Nyche
//
//  Created by Bug on 1/17/21.
//

import Foundation
import SwiftUI

struct SavedCategoryRow: View {
    
    let icon: Image
    let title: String
    
    var body: some View {
        HStack(spacing: 16) {
            HStack(alignment: .firstTextBaseline) {
                icon
                    .font(.system(size: 16, weight: .bold))
            }
            .frame(width: 24, height: 24)
            Text(title)
                .font(.system(.headline, design: .rounded))
                .fontWeight(.bold)
                .lineLimit(1)
            Spacer(minLength: 0)
            Image(systemName: "chevron.right").font(.system(size: 16, weight: .bold))
        }
        .padding(16)
        .background(Color(UIColor.secondarySystemGroupedBackground))
        .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
        .overlay(RoundedRectangle(cornerRadius: 16, style: .continuous).stroke(Color(UIColor.separator), lineWidth: 0.5))
    }
    
}
