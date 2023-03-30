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
                    Divider()
                        .padding()
                    HomeColumn(title: "继续挑战")
                    
                    Divider().padding()
                    
                    HomeColumn(title: "热门线路")
                } else {
                    HomeNewsColumn(listOffset: $listOffset)
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
