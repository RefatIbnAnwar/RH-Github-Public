//
//  UserDetailsView.swift
//  RH-Github-Public
//
//  Created by Md Refat Hossain on 10/01/2025.
//

import SwiftUI

struct UserDetailsView: View {
    
    private var user : GithubUser
    private var viewModel : UserDetailsViewModel
    
    init(user: GithubUser, viewModel: UserDetailsViewModel) {
        self.user = user
        self.viewModel = viewModel
    }
    
    var body: some View {
        
        VStack(alignment: .leading) {
            AsyncImage(url: URL(string: user.avatar_url)) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 80, height: 80)
                    .clipShape(Circle())
            } placeholder: {
                ProgressView()
                    .frame(width: 80, height: 80)
            }
            Text(user.login)
                .font(.headline)
                .lineLimit(1)
            VStack(alignment: .leading) {
                Text(user.name ?? "")
            }
            .font(.caption)
            .foregroundColor(.secondary)
            Divider()
            
            if !viewModel.repositories.isEmpty {
                ScrollView {
                    ForEach(viewModel.repositories, id: \.id ) { repo in
                        GithubRepoCellView(repository: repo)
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
        }
        .padding()
        .onAppear {
            viewModel.fetchRepositories(for: user.login)
        }
    }
}

#Preview {
    UserDetailsView(user: GithubUser.testUser,
                    viewModel: UserDetailsViewModel(repositoryService: RepositoryService()))
}
