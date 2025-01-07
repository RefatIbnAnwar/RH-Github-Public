//
//  UserListView.swift
//  RH-Github-Public
//
//  Created by Md Refat Hossain on 05/01/2025.
//

import SwiftUI

struct UserListView: View {
    
    var viewModel : UserListViewModel
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 100, maximum: 110))]) {
                ForEach(viewModel.githubUserList) { githubUser in
                    UserListCell(user: githubUser)
                        .cornerRadius(10)
                }
            }
        }.onAppear() {
            viewModel.fetchUsers()
        }
    }
}

#Preview {
    UserListView(viewModel: UserListViewModel(userService: UserService(networkService: NetworkService())))
}
