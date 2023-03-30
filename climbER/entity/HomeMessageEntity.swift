//
//  HomeMessageEntity.swift
//  climbER
//
//  Created by 杨阳 on 2023/3/28.
//

import Foundation

//struct img
//{
//    let url: String
//    let order: Int
//}
//
//struct HMessage
//{
//    let nickName:String
//    let createTime:Date
//    let imgList: Array<img>
//
//    // 添加一个初始化方法,参数类型为Data
//    init? (data:Data)
//    {
//        // 将参数的值转换为一个字典
//        guard let obj = try?JSONSerialization.jsonObject(with:data,options:[])
//                as? [String:Any] else {return nil}
//
//        // 根据字典的键，获得相应的值
//        guard let nickName = obj["name"] as?String else {return nil}
//        guard let createTime = obj["createTime"] as?Date else {return nil}
//        guard let imgList = obj["imgList"] as?Array<img> else {return nil}
//
//        // 将这些值依次存储在三个属性中
//        self.nickName = nickName
//        self.createTime = createTime
//        self.imgList = imgList
//    }
//}
//
//// 使User类遵循DecodableEntity协议
//extension HMessage: DecodableEntity
//{
//    static func parse(data : Data) -> Self?
//    {
//        return HMessage(data: data)
//    }
//}


struct img: Codable
{
    let id: Int
    let url: String
    let order: Int
}

struct HMessage: Codable
{
    let id: Int
    let avatarUrl: String
    let nickName: String
    let createTime: String
    let text: String
    let imgList: Array<img>
}

struct HMessageDataList: Codable {
    let data: [HMessage]
}
