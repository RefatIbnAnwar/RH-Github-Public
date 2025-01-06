//
//  APIEndpoint.swift
//  RH-Github-Public
//
//  Created by Md Refat Hossain on 06/01/2025.
//

import Foundation


struct APIEndpoint {
    let path: String
    let method: HTTPMethod
    let headers: [String : String]?
    let queryParameters : [String : String]?
    let body : [String: Any]?
    
    init(path: String, method: HTTPMethod, headers: [String : String]?, queryParameters: [String : String]?, body: [String : Any]?) {
        self.path = APIConstant.baseUrl + path
        self.method = method
        self.headers = headers
        self.queryParameters = queryParameters
        self.body = body
    }
}
