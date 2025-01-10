//
//  UserDetailsView.swift
//  RH-Github-Public
//
//  Created by Md Refat Hossain on 10/01/2025.
//

import SwiftUI

struct UserDetailsView: View {
    
    private var user : GithubUser
    
    init(user: GithubUser) {
        self.user = user
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
            ScrollView {
                ForEach(Array(1...20) , id: \.self ) { _ in
                    GithubRepoCellView(repository: GitHubRepository.testRepository)
                }
            }
        }
        .padding()
    }
}

#Preview {
    UserDetailsView(user: GithubUser.testUser)
}
