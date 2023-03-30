//
//  HomeNewsColumn.swift
//  climbER
//
//  Created by 杨阳 on 2022/10/18.
//

import SwiftUI
import Moya

///
class HomeNewsColumnModel: ObservableObject {
    @Published var messageDataList: [HMessage] = []
    let id: Int
    init(id: Int) {
        self.id = id
        self.getNewsById(id: id)
    }
    
    func getNewsById(id: Int) {
        let provider = MoyaProvider<HomeMessageProvider>()
//        var resultList: Array<HMessage> = []
        provider.request(.getUserHomeMessageList(id: id)) { result in
            switch result {
               case let .success(response):
                    do {
                        let json = try response.map(HMessageDataList.self)
//                        resultList = json.data
                        self.messageDataList = json.data
                        print("new")
                    }
                    catch {
                        // show an error to your user
                        print("error")
                    }

                   // do something in your app
            case let .failure(error):
                print(error)
                   // TODO: handle the error == best. comment. ever.
               }
        }
//        return resultList
    }
}
///


struct HomeNewsColumn: View {
    @Binding var listOffset: CGFloat
    
    let id: Int
    @StateObject private var model: HomeNewsColumnModel
    
    init(listOffset: Binding<CGFloat>, id: Int) {
        self.id = id
        self._listOffset = listOffset
        self._model = StateObject(wrappedValue: HomeNewsColumnModel(id: id))
    }
    
    

    var body: some View {
        
        ScrollViewOffset { offset in
            listOffset = offset
        } content: {
            LazyVStack (spacing: 0) {
//                messageDataList.forEach{ m in
//                    HomeMessage(data: m)
//                    Divider().padding(.horizontal)
//                }
                ForEach(0..<model.messageDataList.count, id: \.self) { index in
                    HomeMessage(data: model.messageDataList[index])
                    Divider().padding(.horizontal)
                }
            }.padding(.zero)
          }
    }
        
}
    

struct HomeNewsColumn_Previews: PreviewProvider {
    static var previews: some View {
        StatefulPreviewWrapper(0.0) { HomeNewsColumn(listOffset: $0, id: 1) }
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

