//
//  ProfileHeaderView.swift
//  Instagram
//
//  Created by G Yashwanth Sharma on 06/09/23.
//

import SwiftUI

struct ProfileHeaderView: View {
    let user : User
    @State private var showEditProfile = false
    var body: some View {
        VStack(spacing:15){
            // pic and stats
            HStack(){
                CircularProfileImageView(user: user,size:.medium)
                
                Spacer()
                    // accounts stats
                HStack(spacing:8){
                  
                    StatView(value: 12, title: "Posts")
                    
                   StatView(value: 3, title: "Followers")
                    
                   StatView(value: 2, title: "Following")
                    
                   
                }
                
                
            }
            .padding(.horizontal)
            
            
            // name and bio
            VStack(alignment: .leading,spacing: 4){
                if let fullname = user.fullName{
                    Text(fullname)
                        .font(.footnote)
                        .fontWeight(.semibold)

                }
                
               
                if let bio = user.bio{
                    Text(bio)
                        .font(.footnote)
                }
            }
            .frame(maxWidth: .infinity , alignment: .leading)
            .padding(.horizontal)
            
            
            // action button
            Button {
                if user.isCurrentUser {
                    showEditProfile.toggle()
                }else{
                    print("follow user....")
                }
                
            } label: {
                
                Text(user.isCurrentUser ? "Edit Profile" : "Follow")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .frame(width: 360 , height: 32)
                    .background(user.isCurrentUser ? .white : Color(.systemBlue))
                    .foregroundColor(user.isCurrentUser ? .black : .white)
                    .cornerRadius(6)
                    .overlay(
                        RoundedRectangle(cornerRadius: 6).stroke(user.isCurrentUser ? .gray : .clear,lineWidth: 1))
            }

            Divider()
        }
        .fullScreenCover(isPresented: $showEditProfile) {
           EditProfileView(user:user)
        }
    }
}

struct ProfileHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeaderView(user: User.MOCK_USERS[0])
    }
}
