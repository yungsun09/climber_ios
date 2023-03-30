//
//  HomeNewsColumn.swift
//  climbER
//
//  Created by 杨阳 on 2022/10/18.
//

import SwiftUI

struct HomeNewsColumn: View {
    @Binding var listOffset: CGFloat
    var body: some View {
        
//        ScrollView(.vertical, showsIndicators:  false) {
//            HomeMessage()
//            Divider().padding(.horizontal)
//            HomeMessage()
//            Divider().padding(.horizontal)
//            HomeMessage()
//            Divider().padding(.horizontal)
//            HomeMessage()
//            Divider().padding(.horizontal)
//            HomeMessage()
//            Divider().padding(.horizontal)
//        }
        
        ScrollViewOffset { offset in
            listOffset = offset
        } content: {
            HomeMessage()
            Divider().padding(.horizontal)
            HomeMessage()
            Divider().padding(.horizontal)
            HomeMessage()
            Divider().padding(.horizontal)
            HomeMessage()
            Divider().padding(.horizontal)
            HomeMessage()
            Divider().padding(.horizontal)
          }
    }
        
}
    

struct HomeNewsColumn_Previews: PreviewProvider {
    static var previews: some View {
        StatefulPreviewWrapper(0.0) { HomeNewsColumn(listOffset: $0) }
//        HomeNewsColumn()
    }
}


// test

private struct OffsetPreferenceKey: PreferenceKey {
  static var defaultValue: CGFloat = .zero
  static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {}
}

struct ScrollViewOffset<Content: View>: View {
  let onOffsetChange: (CGFloat) -> Void
  let content: () -> Content

  init(
    onOffsetChange: @escaping (CGFloat) -> Void,
    @ViewBuilder content: @escaping () -> Content
  ) {
    self.onOffsetChange = onOffsetChange
    self.content = content
  }

  var body: some View {
    ScrollView {
      offsetReader
      content()
        .padding(.top, -8)
    }
    .coordinateSpace(name: "frameLayer")
    .onPreferenceChange(OffsetPreferenceKey.self, perform: onOffsetChange)
  }

  var offsetReader: some View {
    GeometryReader { proxy in
      Color.clear
        .preference(
          key: OffsetPreferenceKey.self,
          value: proxy.frame(in: .named("frameLayer")).minY
        )
    }
    .frame(height: 0)
  }
}

