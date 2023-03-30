//
//  HttpClient.swift
//  climbER
//
//  Created by 杨阳 on 2023/3/28.
//

// 网络连接模块创建

import Foundation

protocol Client
{
    // 给协议添加一个方法，为了使Client可以接收项目中的所有网络请求，在此使用泛型，并使泛型遵httpRequest协议
    func send<T:HttpRequest>(_ request: T, handler: @escaping (T.Response?) -> Void)
}

struct HttpClient:Client
{
    // 实现协议中的方法，以向服务器发送网络请求
    func send<T:HttpRequest>(_ request: T, handler: @escaping (T.Response?) -> Void)
    {
        // 获得服务器的接口地址，并生成一URLRequest对象
        let hostAndPath = request.host.appending(request.path)
        var urlRequest = URLRequest(url: URL(string: hostAndPath)!)
        // 设置网络请求方法
        urlRequest.httpMethod = request.method.rawValue
        
        let dataTask = URLSession.shared.dataTask(with: urlRequest)
        {
            data, _, error in
            guard let data = data, let entity = T.Response.parse(data: data) else
            {
                return
            }
            // 接着返回主线程，在主线程处理生成的实体对象
            DispatchQueue.main.async {
                handler(entity)
            }
        }
        // 调用resume方法，可以访问指定的网络接口,如果不是https格式，还需要修改项目配置文件
        dataTask.resume()
    }
}
