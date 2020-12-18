//
//  FlexView.swift
//  ChuckNorrisFacts
//
//  Created by Pedro Almeida on 18/12/20.
//  Implementaiton by Federico Zanetello
//  Source code origin available on https://github.com/zntfdr/FiveStarsCodeSamples/tree/48e493a2b4acd7196c176689a8f3038936f0ed41/Flexible-SwiftUI (last accessed on 18/12/2020)

import SwiftUI

/// Facade of our view, its main responsibility is to get the available width
/// and pass it down to the real implementation, `_FlexibleView`.
struct FlexView<Data: Collection, Content: View>: View where Data.Element: Hashable {
    let data: Data
    let spacing: CGFloat
    let alignment: HorizontalAlignment
    let content: (Data.Element) -> Content
    @State private var availableWidth: CGFloat = 0

    var body: some View {
        ZStack(alignment: Alignment(horizontal: alignment, vertical: .center)) {
            Color.clear
            .frame(height: 1)
            .readSize { size in
              availableWidth = size.width
            }

            _FlexView(availableWidth: availableWidth,
                      data: data,
                      spacing: spacing,
                      alignment: alignment,
                      content: content)
        }
    }
}


/// This view is responsible to lay down the given elements and wrap them into
/// multiple rows if needed.
fileprivate struct _FlexView<Data: Collection, Content: View>: View where Data.Element: Hashable {
    let availableWidth: CGFloat
    let data: Data
    let spacing: CGFloat
    let alignment: HorizontalAlignment
    let content: (Data.Element) -> Content
    @State var elementsSize: [Data.Element: CGSize] = [:]

    var body : some View {
        VStack(alignment: alignment, spacing: spacing) {
            ForEach(computeRows(), id: \.self) { rowElements in
                HStack(spacing: spacing) {
                    ForEach(rowElements, id: \.self) { element in
                        content(element)
                            .fixedSize()
                            .readSize { elementsSize[element] = $0 }
                    }
                }
            }
        }
    }

    func computeRows() -> [[Data.Element]] {
        var rows: [[Data.Element]] = [[]]
        var currentRow = 0
        var remainingWidth = availableWidth

        for element in data {
            let elementSize = elementsSize[element, default: CGSize(width: availableWidth, height: 1)]

            if remainingWidth - (elementSize.width + spacing) >= 0 {
                rows[currentRow].append(element)
            } else {
                currentRow = currentRow + 1
                rows.append([element])
                remainingWidth = availableWidth
            }

            remainingWidth = remainingWidth - (elementSize.width + spacing)
        }

        return rows
    }
}
