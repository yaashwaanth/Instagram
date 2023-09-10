//
//  CreatePasswordView.swift
//  Instagram
//
//  Created by G Yashwanth Sharma on 05/09/23.
//

import SwiftUI

struct CreatePasswordView: View {
    @EnvironmentObject var viewModel : RegistrationViewModel
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack(spacing: 12){
            Text("Create a password")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.top)
            
            Text("Your password must be at least 6 characters in length.")
                .font(.footnote)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal,24)
            
                
            SecureField("Password" , text:$viewModel.password)
                .modifier(IGTextFeildModifier())
            
            NavigationLink{
                CompleteSignUpView()
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

struct CreatePasswordView_Previews: PreviewProvider {
    static var previews: some View {
        CreatePasswordView()
    }
}
