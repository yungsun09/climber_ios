//
//  routeList.swift
//  climbER
//
//  Created by 杨阳 on 2023/3/27.
//

import SwiftUI
import Kingfisher



struct RouteList: View {
    var body: some View {
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        KFImage.url(URL(string: "https://raw.githubusercontent.com/onevcat/Kingfisher/master/images/logo.png")!)
            .onSuccess { r in
                print(r)
            }
            .placeholder { p in
                ProgressView(p)
            }
            .resizable()
            .aspectRatio(contentMode: .fit)
            .padding()
    }
}


struct RouteList_Previews: PreviewProvider {
    static var previews: some View {
        RouteList()
    }
}
