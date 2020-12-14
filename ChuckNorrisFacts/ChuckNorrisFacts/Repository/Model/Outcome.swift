//
//  Outcome.swift
//  ChuckNorrisFacts
//
//  Created by Pedro Almeida on 14/12/20.
//

import Foundation
import RxSwift

enum Outcome<T> {
    case loading
    case success(result: T)
    case failure(error: Error)
}
