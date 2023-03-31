//
//  HomeMessageProvider.swift
//  climbER
//
//  Created by 杨阳 on 2023/3/30.
//

import Foundation
import Moya

enum HomeMessageProvider {
    case getUserHomeMessageList(id: Int)
}

extension HomeMessageProvider: TargetType {
    var baseURL: URL { return URL(string: BASE_URL + "/v1")! }
    
    var path: String {
        switch self {
        case .getUserHomeMessageList:
            return "/tt"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getUserHomeMessageList:
            return .get
        }
        
    }
        
    var task: Task {
        switch self {
        case let .getUserHomeMessageList(id):
            return .requestParameters(parameters: ["id": id], encoding: URLEncoding.queryString)
        }
    
    }
    
    var headers: [String: String]? {
        return ["Content-type": "application/json"]
    }
}

