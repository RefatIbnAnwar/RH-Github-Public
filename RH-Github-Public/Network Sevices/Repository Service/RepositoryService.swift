//
//  RepositoryService.swift
//  RH-Github-Public
//
//  Created by Md Refat Hossain on 12/01/2025.
//

import Combine

protocol RepositoryServiceProtocol {
    func fetchUserRepository(username: String, page: Int, perPage: Int) -> AnyPublisher<[GitHubRepository], NetworkError>
}

class RepositoryService : RepositoryServiceProtocol {
    
    private let networkService : NetworkServiceProtocol
    
    init(networkService: NetworkServiceProtocol) {
        self.networkService = networkService
    }
    
    func fetchUserRepository(username: String, page: Int, perPage: Int) -> AnyPublisher<[GitHubRepository], NetworkError> {
        let queryParameters = [
            "page" : "\(page)",
            "per_page" : "\(perPage)"
        ]
        
        let endpoint = APIEndpoint(path: APIConstant.repositoryList(userName: username),
                                   method: .get,
                                   headers: nil,
                                   queryParameters: queryParameters, body: nil)
        
        return self.networkService.performRequest(endpoint: endpoint, responseType: [GitHubRepository].self)
    }
    
}
