//
//  EditProfileViewModel.swift
//  Instagram
//
//  Created by G Yashwanth Sharma on 10/09/23.
//

import PhotosUI
import SwiftUI
import Firebase

@MainActor
class EditProfileViewModel: ObservableObject{
    @Published  var fullname = ""
    @Published  var bio = ""
    
    @Published var selectedImage: PhotosPickerItem?{
        didSet{
            Task{
                await loadImage(fromImage:selectedImage)
            }
        }
    }
    @Published var profileImage: Image?
    
    
    @Published var user: User
    
    
    private var uiImage:UIImage?
    
    
    init(user:User){
        self.user = user
        if let fullname = user.fullName{
            self.fullname = fullname
        }
        
        if let bio = user.bio{
            self.bio = bio
        }
    }
    
    
    func loadImage(fromImage item: PhotosPickerItem?) async {
        guard let item = item else {return}
        
        guard let data = try? await item.loadTransferable(type: Data.self) else {return}
        
        guard let uiImage = UIImage(data:data) else {return}
        self.uiImage = uiImage
        
        self.profileImage = Image(uiImage: uiImage)
    }
    
    
    
    func udateUserData() async throws{
        
        // update profile image if changed
        var data = [String:Any]()
        
        if let uiImage = uiImage {
          let imageUrl = try? await   ImageUploader.uploadImage(image: uiImage)
            data["profileImageUrl"] = imageUrl
        }
        // update name if changed
        if !fullname.isEmpty && user.fullName != fullname {
            data["fullName"] = fullname
        }
        
        // update bio if chaged
        if !bio.isEmpty && user.bio != bio {
            data["bio"] = bio
            
        }
        
        if !data.isEmpty{
            try await Firestore.firestore().collection("users").document(user.id).updateData(data)
        }
    }
}
