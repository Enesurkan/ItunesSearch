//
//  MoyaProvider.swift
//  Examplee
//
//  Created by Enes Urkan on 12/28/20.
//  Copyright © 2020 Enes Urkan. All rights reserved.
//

import Foundation
import Moya
import RxSwift


let provider: MoyaProvider<AppAPI> = {
    return MoyaProvider<AppAPI>.init(plugins: [NetworkLoggerPlugin.init(verbose: true,responseDataFormatter: JSONResponseDataFormatter),RequestInterceptor()])
}()

enum AppAPI {
    case search(body: SearchRequest)
}

extension AppAPI: TargetType {
    
    var baseURL: URL {
        return URL(string: "https://itunes.apple.com")!
    }
    
    var path: String {
        switch self {
        case .search: return "/search"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .search: return .get
        }
    }
    
    var parameters: [String: Any] {
        switch self {
        case .search(let body):
            return body.asDictionary() ?? [:]
        }
    }
    
    var task: Task {
        switch self {
        case .search:
            return .requestParameters(parameters: parameters, encoding: URLEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        let header: [String : String] = [
            "Content-Type" : "application/json"
        ]
        return header
    }
    
    var sampleData: Data {
        return "".data(using: .utf8)!
    }
}


private func JSONResponseDataFormatter(_ data: Data) -> Data {
    guard let dataAsJSON = try? JSONSerialization.jsonObject(with: data),
        let prettyData = try? JSONSerialization.data(withJSONObject: dataAsJSON, options: .prettyPrinted) else {return data}
    return prettyData
}
