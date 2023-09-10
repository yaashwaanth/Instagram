//
//  Post.swift
//  Instagram
//
//  Created by G Yashwanth Sharma on 06/09/23.
//

import Foundation
import Firebase

struct Post: Identifiable , Hashable , Codable{
    let id: String
    let ownerUid: String
    let caption: String
    let likes : Int
    let imageUrl: String
//    let timestamp: Date() firebase doesn't accept Date object
    let timestamp: Timestamp
    var user: User?
}


extension Post{
    static var MOCK_POSTS : [Post] = [
        .init(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, caption: "This is some test caption", likes: 75, imageUrl: "person1", timestamp: Timestamp(), user: User.MOCK_USERS[0]) ,
        
            .init(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, caption: "This is some test caption2", likes: 72, imageUrl: "person2", timestamp: Timestamp(), user: User.MOCK_USERS[1]),
        
            .init(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, caption: "This is some test caption3", likes: 71, imageUrl: "person3", timestamp: Timestamp(), user: User.MOCK_USERS[2]),
            
            .init(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, caption: "This is some test caption4", likes: 70, imageUrl: "person4", timestamp: Timestamp(), user: User.MOCK_USERS[2])
    ]
}
