//
//  UserListView.swift
//  RH-Github-Public
//
//  Created by Md Refat Hossain on 05/01/2025.
//

import SwiftUI

struct UserListView: View {
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]) {
                ForEach(0..<20) { index in
                    UserListCell(user: GithubUser.testUser)
                        .cornerRadius(10)
                        .foregroundColor(.blue)
                }
            }
        }
    }
}

#Preview {
    UserListView()
}
