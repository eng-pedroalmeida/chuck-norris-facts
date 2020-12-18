//
//  PastSearchItemView.swift
//  ChuckNorrisFacts
//
//  Created by Usertqi on 18/12/20.
//

import SwiftUI

struct PastSearchItemView: View {
    var text: String
    var onClick: (() -> Void)
    
    @State private var scale: CGFloat = 1.0
    
    var body: some View {
        content()
    }
    
    func content() -> some View {
        return Text(text)
            .scaleEffect(scale)
            .gesture(
                DragGesture(minimumDistance: 0.0, coordinateSpace: .global)
                .onChanged { _ in scale -= 0.05 }
                .onEnded { _ in
                    scale = 1.0
                    onClick()
                }
        )
    }
}

struct PastSearchItemView_Previews: PreviewProvider {
    static var previews: some View {
        PastSearchItemView(text: "Search item", onClick: {})
    }
}
