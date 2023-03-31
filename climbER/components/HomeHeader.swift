//
//  HomeHeader.swift
//  climbER
//
//  Created by 杨阳 on 2022/10/17.
//

import SwiftUI

struct HomeHeader: View {
    @Binding var flag: Bool
    var offsetVal: CGFloat
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 10){
                if (flag) {
                    Text("COG")
                        .font(.title)
                        .fontWeight(.bold)
                    Text("望京东店")
                } else {
                    Text("探索")
                        .font(.title)
                        .fontWeight(.bold)
                    if (offsetVal >= 0) {
                        Text("发生什么事了？")
                    }
                }
                
            }
    //        .foregroundColor(.black)
            .padding()

            Spacer(minLength: 0)
            if (offsetVal >= 0) {
                Button(action: {
                    flag = !flag
                }) {
                    Image(systemName: !flag ? "star" : "arkit")
                        .padding()
                    
                }
                .foregroundColor(Color.white)
                .background(Color.black)
                .cornerRadius(10)
            }
        }
    }
}

struct StatefulPreviewWrapper<Value, Content: View>: View {
    @State var value: Value
    var content: (Binding<Value>) -> Content

    var body: some View {
        content($value)
    }

    init(_ value: Value, content: @escaping (Binding<Value>) -> Content) {
        self._value = State(wrappedValue: value)
        self.content = content
    }
}

struct HomeHeader_Previews: PreviewProvider {
    static var previews: some View {
//        @State var flag: Bool = true
//        HomeHeader(flag: $flag)
        StatefulPreviewWrapper(false) { HomeHeader(flag: $0, offsetVal: 0) }
    }
}


