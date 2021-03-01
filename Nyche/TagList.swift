//
//  TagList.swift
//  Nyche
//
//  Created by Zach on 8/29/20.
//

import SwiftUI
import UIKit

struct TagList: View {

    let tags: [Tag]
    let interactive: Bool

    private func rowCounts(_ geometry: GeometryProxy) -> [Int] { TagList.rowCounts(tags: tags, padding: 20, parentWidth: geometry.size.width) }

    private func tag(rowCounts: [Int], rowIndex: Int, itemIndex: Int) -> String {
        let sumOfPreviousRows = rowCounts.enumerated().reduce(0) { total, next in
            if next.offset < rowIndex {
                return total + next.element
            } else {
                return total
            }
        }
        let tagsIndex = sumOfPreviousRows + itemIndex
        guard tags.count > tagsIndex else { return "[Unknown]" }
        return tags[tagsIndex].string
    }

    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .leading, spacing: 5) {
                ForEach(0 ..< self.rowCounts(geometry).count, id: \.self) { rowIndex in
                    HStack(spacing: 5) {
                        ForEach(0 ..< self.rowCounts(geometry)[rowIndex], id: \.self) { itemIndex in
                            TagButton(title: self.tag(rowCounts: self.rowCounts(geometry), rowIndex: rowIndex, itemIndex: itemIndex), interactive: interactive)
                        }
                    }
                }
            }
        }
    }
}

struct TagList_Previews: PreviewProvider {
    static var previews: some View {
        TagList(tags: [Tag(string: "One"), Tag(string: "Two"), Tag(string: "Three")], interactive: true)
    }
}

extension String {

    func widthOfString(usingFont font: UIFont) -> CGFloat {
        let fontAttributes = [NSAttributedString.Key.font: font]
        let size = self.size(withAttributes: fontAttributes)
        return size.width
    }

}

extension TagList {
    static func rowCounts(tags: [Tag], padding: CGFloat, parentWidth: CGFloat) -> [Int] {
        let tagWidths = tags.map{$0.string.widthOfString(usingFont: UIFont.preferredFont(forTextStyle: .caption1))}

        var currentLineTotal: CGFloat = 0
        var currentRowCount: Int = 0
        var result: [Int] = []

        for tagWidth in tagWidths {
            let effectiveWidth = tagWidth + (2 * padding)
            if currentLineTotal + effectiveWidth <= parentWidth {
                currentLineTotal += effectiveWidth
                currentRowCount += 1
                guard result.count != 0 else { result.append(1); continue }
                result[result.count - 1] = currentRowCount
            } else {
                currentLineTotal = effectiveWidth
                currentRowCount = 1
                result.append(1)
            }
        }

        return result
    }
}

struct TagButton: View {
    
    @Environment(\.colorScheme) var colorScheme

    let title: String
    let interactive: Bool

    private let hPad: CGFloat = 15
    private let height: CGFloat = 30
    private let radius: CGFloat = 5

    var body: some View {
        Button(action: {
            
        }) {
            HStack {
                Text(title)
                    .font(.system(.caption, design: .rounded))
                    .bold()
            }
            .frame(height: height)
            .padding(.horizontal, hPad)
            .foregroundColor(interactive ? .accentColor : .secondary)
            .background(colorScheme == .light ? Color(UIColor.secondarySystemBackground) : Color(UIColor.tertiarySystemBackground))
            .clipShape(RoundedRectangle(cornerRadius: radius, style: .continuous))
            
        }
    }
}
