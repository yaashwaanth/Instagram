//
//  ProfileView.swift
//  Instagram
//
//  Created by G Yashwanth Sharma on 04/09/23.
//

import SwiftUI

struct ProfileView: View {
    let user: User
    
   
    
    var body: some View {
            ScrollView(.vertical){
                
                // header
               ProfileHeaderView(user: user)
            
                // post grid view
             PostGridView(user: user)
                
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            
          
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(user: User.MOCK_USERS[1])
    }
}
