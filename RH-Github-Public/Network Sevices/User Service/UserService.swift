//
//  UserService.swift
//  RH-Github-Public
//
//  Created by Md Refat Hossain on 07/01/2025.
//

import Foundation
import Combine

protocol UserServiceProtocol {
    func fetchUsers(page: Int, perPage: Int) -> AnyPublisher<[GithubUser], NetworkError>
}

class UserService : UserServiceProtocol {
    
    private var networkService : NetworkServiceProtocol
    
    init(networkService: NetworkServiceProtocol) {
        self.networkService = networkService
    }
    
    
    func fetchUsers(page: Int, perPage: Int) -> AnyPublisher<[GithubUser], NetworkError> {
        let queryParameters = [
            "page" : "\(page)",
            "per_page" : "\(perPage)"
        ]
        
        let endpoint = APIEndpoint(path: APIConstant.users,
                                   method: .get,
                                   headers: nil,
                                   queryParameters: queryParameters, body: nil)
        
        return self.networkService.performRequest(endpoint: endpoint, responseType: [GithubUser].self)
    }
    
    
}
