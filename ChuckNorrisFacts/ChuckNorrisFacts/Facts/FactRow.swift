//
//  FactRow.swift
//  ChuckNorrisFacts
//
//  Created by Pedro Almeida on 16/12/20.
//

import SwiftUI

struct FactRow: View {
    var model: FactRowModel
    var share: ((String) -> Void)
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(model.title)
                .font(model.style == .title ? .title : .body)
                .fontWeight(.bold)
            HStack {
                HStack {
                    Text(model.category.uppercased())
                        .fontWeight(.bold)
                        .font(.subheadline)
                }
                .padding(4)
                .foregroundColor(.white)
                .background(Color.blue)
                Spacer()
                shareButton
            }
        }
        .layoutPriority(1)
        .padding()
        .border(Color.gray, width: 2)
    }
    
    var shareButton: some View {
        Button(action: {
            share(model.id)
        }) {
            Image(systemName: "square.and.arrow.up").imageScale(.large)
        }
    }
}

struct FactRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            FactRow(model: FactRowModel(id: "0", title: "The Chuck Norris integration existed even before Slack existed", category: "Tecnology", style: .title), share: { _ in })
            FactRow(model: FactRowModel(id: "1", title: "Chuck Norris, Jesus, and Barack Obama were standing by a lake. Jesus walked out on the water and was shortly followed by Chuck. Obama tried to follow, but fell in the water. After muck kicking and splashing Jesus said: Do you think we should tell him about the \"stepping stones\"? Chuck then said: \"What stepping stone?\"", category: "Political", style: .body), share: { _ in })
        }
        .previewLayout(.fixed(width: 300, height: 550))
    }
}
