//
//  HomeMessage.swift
//  climbER
//
//  Created by 杨阳 on 2022/10/18.
//

import SwiftUI

struct HomeMessage: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 10){
                HStack {
                    Image("")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .background(Color.gray)
                    VStack(alignment: .leading) {
                        Text("无敌大旋风")
                            .fontWeight(.bold)
                        Text("2022年10月9日")
                            .fontWeight(.light)
                            .foregroundColor(Color.gray)
                    }
                    
                }
                VStack {
                    Text("测试一个消息,这个消息要长，要很长，王朝就爱干这个事。")
                    HStack{
                        Image("")
                            .resizable()
                            .frame(width: 100, height: 100)
                            .background(Color.gray)
                        
                        Image("")
                            .resizable()
                            .frame(width: 100, height: 100)
                            .background(Color.gray)
                        
                        
                        Image("")
                            .resizable()
                            .frame(width: 100, height: 100)
                            .background(Color.gray)
                    }
                    
                }
                }
            .padding()
            Spacer(minLength: 0)
        }.padding()
    }
}

struct HomeMessage_Previews: PreviewProvider {
    static var previews: some View {
        HomeMessage()
    }
}
