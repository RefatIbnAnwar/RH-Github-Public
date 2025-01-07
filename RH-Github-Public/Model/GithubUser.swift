//
//  GithubUser.swift
//  RH-Github-Public
//
//  Created by Md Refat Hossain on 06/01/2025.
//

import Foundation


struct GithubUser : Identifiable, Codable {
    let id: Int
    let login: String
    let name: String?
    let bio: String?
    let avatar_url: String
    
    static var testUser = GithubUser(id: 1,
                                     login: "RefatIbnAnwar RefatIbnAnwar",
                                     name: "Md Refat Hossain",
                                     bio: "iOS Engineer",
                                     avatar_url: "https://avatars.githubusercontent.com/u/25253823?v=4"
                            )
}


