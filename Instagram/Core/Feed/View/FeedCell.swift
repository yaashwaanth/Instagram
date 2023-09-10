//
//  FeedCell.swift
//  Instagram
//
//  Created by G Yashwanth Sharma on 04/09/23.
//

import SwiftUI
import Kingfisher
struct FeedCell: View {
    let post: Post
    var body: some View {
        VStack(){
            // Image + Username
            HStack(){
                if let user = post.user{
                    CircularProfileImageView(user: user, size: .xSmall)
                    
                    Text(user.username)
                        .font(.footnote)
                        .fontWeight(.semibold)
                    
                    Spacer()
                }
                }
            .padding(.leading,8)
            
            // post Image
            
            KFImage(URL(string: post.imageUrl))
                .resizable()
                .scaledToFill()
                .frame(height: 400)
                .clipShape(Rectangle())
            
            // action buttons
            
            HStack(spacing:16){
                // Like button
                Button {
                    print("Like post")
                } label: {
                    Image(systemName: "heart")
                        .imageScale(.large)
                }
                
                // Comment

                Button {
                    print("Comment on Post")
                } label: {
                    Image(systemName: "bubble.right")
                        .imageScale(.large)
                }

                
                // Share
                
                Button {
                    print("Share post")
                } label: {
                    Image(systemName: "paperplane")
                        .imageScale(.large)
                }
                
                Spacer()

            }
            .padding(.leading,8)
            .foregroundColor(.black)
            .padding(.top,5)
            
            //Likes labe
            
            Text("\(post.likes) likes")
                .font(.footnote)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity,alignment: .leading)
                .padding(.leading,10)
                .padding(.top,1)
            
            
            //caption label
            
            HStack{
                Text("\(post.user?.username ?? "")").fontWeight(.semibold) +
                Text(post.caption)
            }
            .font(.footnote)
            .frame(maxWidth: .infinity,alignment: .leading)
            .padding(.leading,10)
            .padding(.top,1)
            
            Text("4h ago")
                .font(.footnote)
                .frame(maxWidth: .infinity,alignment: .leading)
                .padding(.leading,10)
                .padding(.top,1)
                .foregroundColor(.gray)
        }
    }
}

struct FeedCell_Previews: PreviewProvider {
    static var previews: some View {
        FeedCell(post: Post.MOCK_POSTS[0])
    }
}
