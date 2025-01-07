//
//  UserListCell.swift
//  RH-Github-Public
//
//  Created by Md Refat Hossain on 05/01/2025.
//

import SwiftUI


struct UserListCell: View {
    
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
        }
        .padding()
        .background {
            Color.orange.opacity(0.3)
//                .ignoresSafeArea()
        }
        
        
    }
}

#Preview {
    UserListCell(user: GithubUser.testUser)
}

