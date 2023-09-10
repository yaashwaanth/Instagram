//
//  UploadPostView.swift
//  Instagram
//
//  Created by G Yashwanth Sharma on 06/09/23.
//

import SwiftUI
import PhotosUI

struct UploadPostView: View {
    
    func clearPostDataAndReturnToFeed(){
        caption = ""
        viewModel.selectedImage = nil
        viewModel.postImage = nil
        tabIndex = 0
    }
    
    @State private var caption = ""
    @State private var imagePicekerPresented = false
    @StateObject var viewModel = UploadPostViewModel()
    @Binding var tabIndex: Int
    var body: some View {
        VStack(){
            // action tool bar
            HStack{
                Button {
//                    caption = ""
//                    viewModel.selectedImage = nil
//                    viewModel.postImage = nil
//                    tabIndex = 0
//                    or
                    clearPostDataAndReturnToFeed()
                    
                } label: {
                    Text("Cancel")
                }
                
                Spacer()
                
                Text("New Post")
                    .fontWeight(.semibold)
                
                
                Spacer()
                
                
                Button {
                    Task{
                        try await viewModel.uploadPost(caption:caption)
                        clearPostDataAndReturnToFeed()
                        
                    }
                } label: {
                    Text("Upload")
                        .fontWeight(.semibold)
                }

            }
            .padding(.horizontal)
            
            // post image and caption
            HStack{
                if let image = viewModel.postImage{
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100 , height: 100)
                        .clipped()
                }
                TextField("Enter you cation...",text: $caption,axis:.vertical)
                
            }
            Spacer()
        }
        .photosPicker(isPresented: $imagePicekerPresented, selection: $viewModel.selectedImage)
        .onAppear{
            imagePicekerPresented.toggle()
        }
    }
    
    
    
}

struct UploadPostView_Previews: PreviewProvider {
    static var previews: some View {
        UploadPostView(tabIndex: .constant(0))
    }
}





