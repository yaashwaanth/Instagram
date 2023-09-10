//
//  SearchViewModel.swift
//  Instagram
//
//  Created by G Yashwanth Sharma on 10/09/23.
//

import Foundation


class SearchViewModel: ObservableObject {
    @Published var users = [User] ()
    
    init(){
        Task{
            try await fetchAllUsers()
        }
    }
    @MainActor
    func fetchAllUsers() async throws {
        self.users = try await UserService.fetchAllUsers()
    }
}
