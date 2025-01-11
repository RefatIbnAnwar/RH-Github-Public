//
//  APIConstant.swift
//  RH-Github-Public
//
//  Created by Md Refat Hossain on 06/01/2025.
//

struct APIConstant {
    static let environment = Environment.development
    
    static let baseUrl = environment.baseUrl
    static let apiKey : String = "my_api_key"
    
    
    static let users = "/users"
    
    static func repositoryList(userName: String) -> String {
        return "/users/\(userName)/repos"
    }
}
