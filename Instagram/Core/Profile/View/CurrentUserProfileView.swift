//
//  CurrentUserProfileView.swift
//  Instagram
//
//  Created by G Yashwanth Sharma on 06/09/23.
//

import SwiftUI

struct CurrentUserProfileView: View {
    // new
   
    let user: User
    
     var posts: [Post]{
        return Post.MOCK_POSTS.filter({$0.user?.username == user.username})
    }
    
    var body: some View {
        NavigationStack{
                  ScrollView(.vertical){
                      
                       // header
                       ProfileHeaderView(user: user)
                  
                      // post grid view
                      PostGridView(user: user)
                      
                  }
                  .navigationTitle("Profile")
                  .navigationBarTitleDisplayMode(.inline)
                  // new
                  .toolbar {
                      ToolbarItem(placement: .navigationBarTrailing) {
                          Button {
                              AuthService.shared.signout()
                          } label: {
                              Image(systemName: "line.3.horizontal")
                                  .foregroundColor(.black)
                          }

                      }
                  }
              }
    }
}

struct CurrentUserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentUserProfileView(user: User.MOCK_USERS[2])
    }
}
