//
//  FeedView.swift
//  Instagram
//
//  Created by G Yashwanth Sharma on 04/09/23.
//

import SwiftUI

struct FeedView: View {
    @StateObject var viewModel = FeedViewModel()
    
    var body: some View {
        
        NavigationStack{
            ScrollView{
                LazyVStack(spacing:32){
                    ForEach(viewModel.posts){ post in
                        FeedCell(post:post)
                     
                    }
                }
                .padding(.top,8)
            }
            .navigationTitle("Feed")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .navigationBarLeading) {
                    Text("Burbn")
                        .font(.title3)
                        .fontWeight(.semibold)
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                 Image(systemName: "paperplane")
                        .imageScale(.large)
                }
            }

        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
