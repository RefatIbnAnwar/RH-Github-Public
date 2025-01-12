//
//  GithubRepoCellView.swift
//  RH-Github-Public
//
//  Created by Md Refat Hossain on 10/01/2025.
//

import SwiftUI

struct GithubRepoCellView: View {
    
    private let repository : GitHubRepository
    
    init(repository: GitHubRepository) {
        self.repository = repository
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(repository.name)
                .font(.headline)
            
            if let description = repository.description {
                Text(description)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .lineLimit(2)
                    .multilineTextAlignment(.leading)
            }
            
            HStack {
                if let language = repository.language {
                    Text("Language: \(language)")
                        .font(.caption)
                        .foregroundColor(.primary)
                }
                
                Text("⭐ \(repository.stargazers_count)")
                    .font(.caption)
                    .foregroundColor(.primary)
            }
            Divider()
                .padding(.top, 4)
        }
        
    }
}

#Preview {
    GithubRepoCellView(repository: GitHubRepository.testRepository)
}
