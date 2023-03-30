//
//  UserEntity.swift
//  climbER
//
//  Created by 杨阳 on 2023/3/27.
//

import Foundation

struct User
{
    let nickName:String

    // 添加一个初始化方法,参数类型为Data
    init? (data:Data)
    {
        // 将参数的值转换为一个字典
        guard let obj = try?JSONSerialization.jsonObject(with:data,options:[])
                as? [String:Any] else {return nil}
        
        // 根据字典的键，获得相应的值
        guard let nickName = obj["name"] as?String else {return nil}
        
        // 将这些值依次存储在三个属性中
        self.nickName = nickName
    }
}

// 使User类遵循DecodableEntity协议
extension User: DecodableEntity
{
    static func parse(data : Data) -> Self?
    {
        return User(data: data)
    }
}
