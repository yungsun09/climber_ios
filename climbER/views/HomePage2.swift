//
//  SwiftUIView.swift
//  climbER
//
//  Created by 杨阳 on 2022/10/18.
//

import SwiftUI


struct HomeColumnView : View {
    @State var isIndoor = true
    @State var listOffset: CGFloat = 0.0
    var body: some View {
        VStack {
            HomeHeader(flag: $isIndoor, offsetVal: listOffset )
                .padding(.horizontal)
            
            ScrollView  {
                Divider()
                    .padding()
                HomeColumn(title: "继续挑战")
                
                Divider().padding()
                
                HomeColumn(title: "热门线路")
                
                Divider().padding()
                
                HomeColumn(title: "我的收藏")
            }
        }
    }
}

struct HomeNewsColumnView : View {
    @State var isIndoor = false
    @State var listOffset: CGFloat = 0.0
    var body: some View {
        VStack {
            HomeHeader(flag: $isIndoor, offsetVal: listOffset )
                .padding(.horizontal)
            
            HomeNewsColumn(listOffset: $listOffset, id: 1)
        }
    }
}

struct HomePage2 : View {
    @State var isIndoor = false
    @State var listOffset: CGFloat = 0.0
    var body: some View {
        NavigationView {
            VStack {
                TabView{

                    HomeNewsColumnView().tabItem {
                                   Image(systemName: "arkit").foregroundColor(.red)
                                   Text("探索")
                               }
                               
                    HomeColumnView().tabItem {
                                   Image(systemName: "star")
                                   Text("路线")
                               }
                               
                           }

                
                
                Spacer(minLength: 0)
                
            }
            .background(
                Color.black.opacity(0.00).ignoresSafeArea(.all, edges: .all))
        }
    }
}

struct HomePage2_Previews: PreviewProvider {
    static var previews: some View {
        HomePage2()
    }
}
