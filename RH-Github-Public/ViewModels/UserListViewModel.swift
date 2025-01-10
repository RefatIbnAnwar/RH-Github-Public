//
//  UserListViewModel.swift
//  RH-Github-Public
//
//  Created by Md Refat Hossain on 07/01/2025.
//

import Foundation
import Combine

@Observable
class UserListViewModel {
    
    var githubUserList : [GithubUser] = []
    var isLoading : Bool = false
    var errorMessage : String = ""
    private var currentPage : Int = 1
    private var perPage : Int = 100
    private var userService : UserServiceProtocol
    private var cancellables = Set<AnyCancellable>()
    
    init(userService: UserServiceProtocol) {
        self.userService = userService
    }
    
    
    func fetchUsers() {
        guard !isLoading else {
            return
        }
        isLoading = true
        
        userService.fetchUsers(page: currentPage, perPage: perPage)
            .sink { [weak self] complition in
                switch complition {
                case .finished:
                    print("fetching finished")
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                }
                self?.isLoading = false
            } receiveValue: { [weak self] githubUsers in
                self?.githubUserList.append(contentsOf: githubUsers)
                print(self?.githubUserList.count)
                self?.currentPage += 1
                print(self?.currentPage)
            }
            .store(in: &cancellables)

    }
}
