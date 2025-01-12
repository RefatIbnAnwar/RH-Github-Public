//
//  UserDetailsViewModel.swift
//  RH-Github-Public
//
//  Created by Md Refat Hossain on 12/01/2025.
//

import Foundation
import Combine

@Observable
class UserDetailsViewModel {
    private var cancellables = Set<AnyCancellable>()
    private var repositoryService: RepositoryService
    var isLoading : Bool = false
    var currentPage: Int = 1
    var perPage: Int = 20
    var errorMessage : String = ""
    
    var repositories : [GitHubRepository] = []
    
    init(repositoryService: RepositoryService) {
        self.repositoryService = repositoryService
    }
    
    func fetchRepositories(for userName: String) {
        guard !isLoading else {
            return
        }
        isLoading = true
        
        repositoryService.fetchUserRepository(username: userName, page: currentPage, perPage: perPage)
            .sink {[weak self] complition in
                switch complition {
                case .finished:
                    print("fetching finished")
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                }
                self?.isLoading = false
            } receiveValue: { [weak self] list in
                self?.repositories.append(contentsOf: list)
                self?.currentPage += 1
            }.store(in: &cancellables)

    }
}
