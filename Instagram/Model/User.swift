//
//  User.swift
//  Instagram
//
//  Created by G Yashwanth Sharma on 05/09/23.
//

import Foundation
import Firebase

struct User: Identifiable, Hashable , Codable{
    let id: String
    var username: String
    var profileImageUrl: String?
    var fullName: String?
    var bio: String?
    let email: String
    
    var isCurrentUser: Bool{
        guard let currentUid = Auth.auth().currentUser?.uid else {return false}
        return currentUid == id
    }
    
}


extension User{
    static var MOCK_USERS: [User] = [
        
        .init(id: NSUUID().uuidString, username: "yaashwaanth", profileImageUrl: nil , fullName: "G Yashwanth Sharma" , bio: "Hello there"  , email: "gys@gmail.com"),
        
        .init(id: NSUUID().uuidString, username: "ajithSharma", profileImageUrl: nil , fullName: "G Ajith Sharma" , bio: "Cricket"  , email: "gas@gmail.com"),
        
        .init(id: NSUUID().uuidString, username: "akishithSharma", profileImageUrl:nil , fullName: "G V Akshith Sharma" , bio: "Ironman suit building"  , email: "gvas@gmail.com"),
    ]
}
