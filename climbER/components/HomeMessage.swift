//
//  HomeMessage.swift
//  climbER
//
//  Created by 杨阳 on 2022/10/18.
//

import SwiftUI
import Kingfisher

struct HomeMessage: View {
    let messageData: HMessage
    
    init(data: HMessage) {
        self.messageData = data
    }

    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 10){
                HStack {
                    KFImage.url(URL(string: messageData.avatarUrl)!)
                        .onSuccess { r in
                            print(r)
                        }
                        .placeholder { p in
                            ProgressView(p)
                        }
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 40, height: 40)


                    VStack(alignment: .leading) {
                        Text(messageData.nickName)
                            .fontWeight(.bold)
                        Text(messageData.createTime)
                            .fontWeight(.light)
                            .foregroundColor(Color.gray)
                    }
                    
                }
                VStack {
                    Text(messageData.text)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    HStack{
                        ForEach(messageData.imgList, id: \.id) { imgData in
                            KFImage.url(URL(string: imgData.url)!)
                                .onSuccess { r in
                                    print(r)
                                }
                                .placeholder { p in
                                    ProgressView(p)
                                }
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 100, height: 100)
                        }
//                        Image("")
//                            .resizable()
//                            .frame(width: 100, height: 100)
//                            .background(Color.gray)
//
//                        Image("")
//                            .resizable()
//                            .frame(width: 100, height: 100)
//                            .background(Color.gray)
//
//
//                        Image("")
//                            .resizable()
//                            .frame(width: 100, height: 100)
//                            .background(Color.gray)
                    }
                    
                }
                }
            .padding()
            Spacer(minLength: 0)
        }
        .padding()
    }
}

struct HomeMessage_Previews: PreviewProvider {
    static var previews: some View {
        let json = """
            {
                "id": 1,
                "nickName": "测试文本",
                "avatarUrl": "https://raw.githubusercontent.com/onevcat/Kingfisher/master/images/logo.png",
                "createTime": "2021-12-21",
                "text": "测试文本",
                "imgList": [
                    {
                        "id": 1,
                        "url": "https://raw.githubusercontent.com/onevcat/Kingfisher/master/images/logo.png",
                        "order": 3
                    },
                    {
                        "id": 2,
                        "url": "https://raw.githubusercontent.com/onevcat/Kingfisher/master/images/logo.png",
                        "order": 2
                    },
                    {
                        "id": 3,
                        "url": "https://raw.githubusercontent.com/onevcat/Kingfisher/master/images/logo.png",
                        "order": 1
                    },
                ]
            }
        """

        let data = json.data(using: .utf8)!
        let decoder = JSONDecoder()
        let hmessage = try! decoder.decode(HMessage.self, from: data)

        HomeMessage(data: hmessage)
    }
}
