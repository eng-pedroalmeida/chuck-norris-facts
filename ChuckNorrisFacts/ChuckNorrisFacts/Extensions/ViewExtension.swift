//
//  ViewExtension.swift
//  ChuckNorrisFacts
//
//  Created by Pedro Almeida on 18/12/20.
//
//  Implementaiton by Federico Zanetello
//  Source code origin available on
//  https://github.com/zntfdr/FiveStarsCodeSamples/blob/48e493a2b4acd7196c176689a8f3038936f0ed41/Flexible-SwiftUI (last accessed on 18/12/2020)
//

import SwiftUI

private struct SizePreferenceKey: PreferenceKey {
  static var defaultValue: CGSize = .zero
  static func reduce(value: inout CGSize, nextValue: () -> CGSize) {}
}

extension View {
  func readSize(onChange: @escaping (CGSize) -> Void) -> some View {
    background(
      GeometryReader { geometryProxy in
        Color.clear
          .preference(key: SizePreferenceKey.self, value: geometryProxy.size)
      }
    )
    .onPreferenceChange(SizePreferenceKey.self, perform: onChange)
  }
}
