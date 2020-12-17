//
//  FactRowModel.swift
//  ChuckNorrisFacts
//
//  Created by Pedro Almeida on 16/12/20.
//

import Foundation

struct FactRowModel {
    var id: String
    var title: String
    var category: String
    var style: FactRowStyle
    
    enum FactRowStyle {
        case title, body
    }
}
