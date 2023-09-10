//
//  AddEmailView.swift
//  Instagram
//
//  Created by G Yashwanth Sharma on 05/09/23.
//

import SwiftUI

struct AddEmailView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: RegistrationViewModel
    
    var body: some View {
        VStack(spacing: 12){
            Text("Add your email")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.top)
            
            Text("You'll use this email to sign in to your account")
                .font(.footnote)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal,24)
            
//                TextField("Enter your email" , text:$email)
//                    .autocapitalization(.none)
//                    .font(.subheadline)
//                    .padding(12)
//                    .background(Color(.systemGray6))
//                    .cornerRadius(10)
//                    .padding(.horizontal,24)
//                    .padding(.top)
            TextField("Enter your email" , text:$viewModel.email)
                .autocapitalization(.none)
                .modifier(IGTextFeildModifier())
            
            NavigationLink{
                CreateUsernameView()
                    .navigationBarBackButtonHidden(true)
            } label: {
                Text("Next")
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

struct AddEmailView_Previews: PreviewProvider {
    static var previews: some View {
        AddEmailView()
    }
}
