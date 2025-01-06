//
//  ContentView.swift
//  RH-Github-Public
//
//  Created by Md Refat Hossain on 05/01/2025.
//

import SwiftUI

struct ContentView: View {
    
    @State private var searchText : String = ""
    @State private var isSearchActive : Bool = false
    var body: some View {
        NavigationStack {
            VStack {
                Divider()
                UserListView()
            }
            .navigationTitle("Users")
            .navigationBarTitleDisplayMode(.automatic)
        }.searchable(text: $searchText,
                     isPresented: $isSearchActive,
                     prompt: Text("Looking for a user?"))
    }
}

#Preview {
    ContentView()
}
