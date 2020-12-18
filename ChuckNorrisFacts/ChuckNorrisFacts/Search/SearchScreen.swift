//
//  SearchScreen.swift
//  ChuckNorrisFacts
//
//  Created by Pedro Almeida on 17/12/20.
//

import SwiftUI

struct SearchScreen: View {
    @State private var searchTerm: String = ""
    
    var pastSearches = ["Star Wars", "Github", "Trump", "Dumb"]
    var categories: [String] = ["Games", "Sports", "Dev", "Science", "Technology", "music", "travel", "carrer"]

    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack(alignment: .leading, spacing: 24) {
                    searchView
                    suggestionsView
                    pastSearchesView
                }.padding()
            }
            .navigationBarTitle("Search Facts", displayMode: .inline)
        }
    }
    
    var searchView: some View {
        TextField("Enter your search term", text: $searchTerm)
            .padding(8)
            .overlay(RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.gray, lineWidth: 1))
    }
    
    var suggestionsView: some View {
        VStack(alignment: .leading) {
            Text("Suggestions")
                .fontWeight(.bold)
            FlexView(data: categories, spacing: 10, alignment: .leading) { category in
                CategoryView(name: category) {
                    print(category)
                }
            }
        }
        
    }
    
    var pastSearchesView: some View {
        VStack(alignment: .leading) {
            Text("Past Searches")
                .fontWeight(.bold)
            LazyVStack(alignment: .leading, spacing: 12) {
                ForEach((pastSearches), id: \.self) { item in
                    PastSearchItemView(text: item) {
                        print(item)
                    }
                }
            }
        }
    }
}

struct SearchScreen_Previews: PreviewProvider {
    static var previews: some View {
        SearchScreen()
    }
}
