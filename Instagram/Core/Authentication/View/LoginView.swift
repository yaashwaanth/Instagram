//
//  LoginView.swift
//  Instagram
//
//  Created by G Yashwanth Sharma on 05/09/23.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewModel()
    
    var body: some View {
        NavigationStack{
            VStack{
                Spacer()
                Text("Burbn")
                    .font(.largeTitle)
                    .frame(width: 220,height: 100)
                    .fontWeight(.bold)
                
                // text feilds
                
                VStack(){
                    TextField("Enter your email" , text:$viewModel.email)
                        .autocapitalization(.none)
                        .modifier(IGTextFeildModifier())
//                        .font(.subheadline)
//                        .padding(12)
//                        .background(Color(.systemGray6))
//                        .cornerRadius(10)
//                        .padding(.horizontal,24)
                    
                    SecureField("Enter your password" , text:$viewModel.password)
                        .modifier(IGTextFeildModifier())
                    
                    
                }
                Button {
                    print("Show forgot password")
                } label: {
                    Text("Forgot Password?")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .padding(.top)
                        .padding(.trailing,28)
                }
                .frame(maxWidth: .infinity,alignment: .trailing)

                Button {
                    Task{
                        try await viewModel.signIn()
                    }
                } label: {
                    Text("Login")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .frame(width: 360,height: 44)
                        .background(Color(.systemBlue))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding(.vertical)
                
                HStack{
                    Rectangle()
                        .frame(width: (UIScreen.main.bounds.width/2)-40 , height: 0.5)
                        
                    
                    Text("OR")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .foregroundColor(.gray)
                    
                    Rectangle()
                        .frame(width: (UIScreen.main.bounds.width/2)-40 , height: 0.5)
                        
                }
                .foregroundColor(.gray)
                
                HStack(){
                    Image("fblogo")
                        .resizable()
                        .frame(width: 20 , height: 20)
                    Text("Continue with facebook")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .foregroundColor(Color(.systemBlue))
                }
                
                Spacer()
                
                Divider()
                NavigationLink {
                    AddEmailView()
                        
                        .navigationBarBackButtonHidden(true)
                } label: {
                    HStack(spacing:3){
                        Text("Don't have an account?")
                            
                        
                        Text("Sign Up")
                            .fontWeight(.semibold)
                    }
                }
                .padding(.vertical,16)
                .font(.footnote)

            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
