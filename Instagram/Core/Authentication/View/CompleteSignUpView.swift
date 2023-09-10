//
//  CompleteSignUpView.swift
//  Instagram
//
//  Created by G Yashwanth Sharma on 05/09/23.
//

import SwiftUI

struct CompleteSignUpView: View {
    @EnvironmentObject var viewModel : RegistrationViewModel
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack(spacing: 12){
            Spacer()
            Text("Welcome to Instagram, \(viewModel.username)")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.top)
                .multilineTextAlignment(.center)

                
            
            Text("Click below to complete registration and start visiting instagram")
                .font(.footnote)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal,24)
            
          
            
            Button{
                Task{
                    try await viewModel.createUser()

                }
                    
            } label: {
                Text("Complete Signup")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .frame(width: 360,height: 44)
                    .background(Color(.systemBlue))
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding(.vertical)
            
            Spacer()
                
        }
        .toolbar{
            ToolbarItem(placement: .navigation){
                Image(systemName: "chevron.left")
                    .imageScale(.large)
                    .onTapGesture {
                        dismiss()
                    }
            }
        }
    }
}

struct CompleteSignUpView_Previews: PreviewProvider {
    static var previews: some View {
        CompleteSignUpView()
    }
}
