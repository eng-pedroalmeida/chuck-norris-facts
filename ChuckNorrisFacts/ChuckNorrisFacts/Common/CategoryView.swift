//
//  CategoryView.swift
//  ChuckNorrisFacts
//
//  Created by Pedro Almeida on 17/12/20.
//

import SwiftUI

struct CategoryView: View {
    var name: String
    var onClick: (() -> Void)?
    
    @State private var scale: CGFloat = 1.0
    
    var body: some View {
        content()
    }
    
    func content() -> some View {
        let view = HStack {
            Text(name.uppercased())
                .fontWeight(.bold)
                .font(.subheadline)
        }
        .padding(8)
        .foregroundColor(.white)
        .background(Color.blue)
        
        if let onClick = onClick {
            return AnyView(
                view.scaleEffect(scale)
                    .gesture(
                    DragGesture(minimumDistance: 0.0, coordinateSpace: .global)
                        .onChanged { _ in scale -= 0.05 }
                        .onEnded { _ in
                            scale = 1.0
                            onClick()
                        }
                )
            )
        }
        
        return AnyView(view)
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView(name: "Category")
    }
}
