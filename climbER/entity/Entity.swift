//
//  Entity.swift
//  climbER
//
//  Created by 杨阳 on 2023/3/27.
//

import Foundation

protocol DecodableEntity
{
    // 往协议中添加一个静态方法，用来将Data数据转换为实例本身。
    static func parse(data : Data) -> Self?
}
