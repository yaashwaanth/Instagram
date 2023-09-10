//
//  UserService.swift
//  Instagram
//
//  Created by G Yashwanth Sharma on 10/09/23.
//

import Foundation
import Firebase



struct UserService {
    
    
    
    
    static func fetchUser(withUid uid: String) async throws -> User {
        
        let snapshot = try await Firestore.firestore().collection("users").document(uid).getDocument()
        return try snapshot.data(as:User.self)
    }
    
     static func fetchAllUsers() async throws -> [User] {
//         var  users = [User]()
//         let snapshots = try await Firestore.firestore().collection("users").getDocuments()
//         let documents = snapshots.documents
//
//         for doc in documents{
//             // converting to swift objects
//             guard let user = try? doc.data(as:User.self) else {return users}
//             users.append(user)
//         }
//
//
//         return users
         
         // 2nd method
         let snapshots = try await Firestore.firestore().collection("users").getDocuments()
         return snapshots.documents.compactMap { try? $0.data(as:User.self)}
    }
}
