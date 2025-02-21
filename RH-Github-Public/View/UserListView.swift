//
//  UserListView.swift
//  RH-Github-Public
//
//  Created by Md Refat Hossain on 05/01/2025.
//

import SwiftUI

struct UserListView: View {
    
    var viewModel : UserListViewModel
    
    
    private let gridSpacing: CGFloat = 5
    private let gridItemPadding: CGFloat = 5
    private var gridColumn: [GridItem] {
            [GridItem(.adaptive(minimum: UIScreen.main.bounds.width / 3 - gridItemPadding * 2))]
        }
        
    let threeColumnGrid = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                if !viewModel.githubUserList.isEmpty {
                    LazyVGrid(columns: threeColumnGrid, spacing: gridSpacing) {
                        ForEach(viewModel.githubUserList, id:\.id) { githubUser in
                            NavigationLink {
                                UserDetailsView(user: githubUser, viewModel: UserDetailsViewModel(repositoryService: RepositoryService(networkService: NetworkService())))
                            } label: {
                                UserListCell(user: githubUser)
                                    .cornerRadius(10)
                                    .onAppear() {
                                        //MARK:  Uncomment it if you want pagination
                                        //                                    if githubUser.login == viewModel.githubUserList.last?.login {
                                        //                                        viewModel.fetchUsers()
                                        //                                    }
                                    }
                            }
                        }
                    }
                } else if let errorMessage = viewModel.errorMessage {
                    Text("Error: \(errorMessage)")
                        .foregroundColor(.red)
                        .multilineTextAlignment(.center)
                        .padding()
                } else {
                    ProgressView("Loading...")
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
            }.onAppear() {
                if viewModel.githubUserList.isEmpty {
                    viewModel.fetchUsers() // Initial data fetch
                }
            }
        }
    }
}

#Preview {
    UserListView(viewModel: UserListViewModel(userService: UserService()))
}
