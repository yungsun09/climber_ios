//
//  SwiftUIView.swift
//  climbER
//
//  Created by 杨阳 on 2022/10/18.
//

import SwiftUI


struct HomePage : View {
    @State var isIndoor = false
    @State var listOffset: CGFloat = 0.0
    var body: some View {
        NavigationView {
            VStack {
                // header
                HomeHeader(flag: $isIndoor, offsetVal: listOffset )
                    .padding(.horizontal)
                
                
                if (isIndoor) {
                    ScrollView  {
                        Divider()
                            .padding()
                        HomeColumn(title: "继续挑战")
                        
                        Divider().padding()
                        
                        HomeColumn(title: "热门线路")
                        
                        Divider().padding()
                        
                        HomeColumn(title: "我的收藏")
                    }
                } else {
                    
                    TabView{
                        HomeNewsColumn(listOffset: $listOffset, id: 1).tabItem {
                                   Image(systemName: "arkit").foregroundColor(.red)
                                   Text("场内")
                               }
                               
                        HomeNewsColumn(listOffset: $listOffset, id: 1).tabItem {
                                   Image(systemName: "star")
                                   Text("关注")
                               }
                               
                           }

                }
                
                Spacer(minLength: 0)
                
            }
            .background(
                Color.black.opacity(0.00).ignoresSafeArea(.all, edges: .all))
        }
    }
}

struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomePage()
    }
}
