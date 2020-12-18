//
//  FactsScreen.swift
//  ChuckNorrisFacts
//
//  Created by Pedro Almeida on 16/12/20.
//

import SwiftUI

struct FactsScreen: View {
    @State private var showSearchModal = false
    
    var facts: [Fact] = [Fact(id: "0", value: "The Chuck Norris integration existed even before Slack existed", categories: ["Tecnology"]),
                         Fact(id: "1", value: "Chuck Norris, Jesus, and Barack Obama were standing by a lake. Jesus walked out on the water and was shortly followed by Chuck. Obama tried to follow, but fell in the water. After muck kicking and splashing Jesus said: Do you think we should tell him about the \"stepping stones\"? Chuck then said: \"What stepping stone?\"", categories: [])]
    
    var body: some View {
        NavigationView {
            VStack {
                if facts.isEmpty {
                    emptyView
                } else {
                    list
                }
            }
            .navigationBarTitle("Chuck Norris Facts")
            .navigationBarItems(trailing: searchButton)
            .sheet(isPresented: $showSearchModal, content: {
                SearchScreen()
            })
        }
    }
    
    var list: some View {
        ScrollView {
            LazyVStack {
                ForEach((facts), id: \.id) { item in
                    FactRow(model: FactRowModel(id: item.id,
                                                title: item.value,
                                                category: item.categories.first ?? "Uncategorized",
                                                style: item.value.count > 80 ? .body : .title)) { id in
                        print("share")
                    }
                }
            }.padding()
        }
    }
    
    var emptyView: some View {
        Text("No Facts found. Click on search button and found some facts about Chuck Norris.")
    }
    
    var searchButton: some View {
        Button(action: { showSearchModal = true }) {
            Image(systemName: "magnifyingglass").imageScale(.large)
        }
    }
}

struct FactsScreen_Previews: PreviewProvider {
    static var previews: some View {
        FactsScreen()
    }
}
