//
//  GithubRepository.swift
//  RH-Github-Public
//
//  Created by Md Refat Hossain on 11/01/2025.
//

import Foundation


struct GitHubRepository: Identifiable, Codable {
    let id: Int
    let name: String
    let description: String?
    let language: String?
    let stargazers_count: Int
    let fork: Bool
    let forks_count: Int
    let html_url: String
    
    
    static let testRepository = GitHubRepository(id: 12345345,
                                                 name: "Demo Repo",
                                                 description: "Description text",
                                                 language: "Programing Language",
                                                 stargazers_count: 99,
                                                 fork: true,
                                                 forks_count: 69,
                                                 html_url: "https://github.com/RefatIbnAnwar/Alamofire-Practice")
    
}
