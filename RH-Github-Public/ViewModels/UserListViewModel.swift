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
    private var perPage : Int = 30
    private var userService : UserServiceProtocol
    private var cancellables = Set<AnyCancellable>()
    
    init(userService: UserServiceProtocol) {
        self.userService = userService
    }
    
    
    func fetchUsers() {
        userService.fetchUsers(page: currentPage, perPage: perPage)
            .sink { [weak self] complition in
                switch complition {
                case .finished:
                    print("fetching finished")
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                }
            } receiveValue: { githubUsers in
                self.githubUserList = githubUsers
                print(self.githubUserList.count)
                self.currentPage += 1
            }
            .store(in: &cancellables)

    }
}
