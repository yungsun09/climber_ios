//
//  HttpRequest.swift
//  climbER
//
//  Created by 杨阳 on 2023/3/27.
//

import Foundation

enum HttpRequestMethod: String
{
    case GET
    case POST
    case PUT
    case DELETE
}

protocol HttpRequest
{
    var path: String { get }
    var method: HttpRequestMethod { get }
    var parameter: [String:Any] { get }
    
    associatedtype Response: DecodableEntity
}

extension HttpRequest
{
    var host: String { return "http://127.0.0.1:5550" }
}
