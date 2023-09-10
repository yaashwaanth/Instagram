//
//  ContentView.swift
//  Instagram
//
//  Created by G Yashwanth Sharma on 04/09/23.
//

import SwiftUI

struct ContentView: View {
    // contentViewModel is listening to AuthService
    @StateObject var viewModel = ContentViewModel()
    @StateObject var registrationViewModel = RegistrationViewModel()
    var body: some View {
        
        Group{
            if viewModel.userSession == nil {
                
                LoginView()
                    .environmentObject(registrationViewModel)
            }else if let currentUser = viewModel.currentUser{
                
                MainTabView(user:currentUser)
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
