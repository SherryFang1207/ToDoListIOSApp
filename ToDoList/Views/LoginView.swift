//
//  LoginView.swift
//  ToDoList
//
//  Created by 房子祺 on 12/1/23.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewViewModel()
    
    var body: some View {
        NavigationView {
            
            VStack{
                //MARK: - Header
                HeaderView(title: "To Do List", subtitle: "Get things done", angle: 15, background: .pink)
                
                //MARK: - Login Form
                
                Form {
                    
                    if !viewModel.errorMessage.isEmpty{
                        Text(viewModel.errorMessage)
                            .foregroundColor(Color.red)
                    }
                    
                    TextField("Email Address", text: $viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocorrectionDisabled()
                    
                    TextField("Password", text: $viewModel.email).textFieldStyle(DefaultTextFieldStyle())
                        .autocorrectionDisabled()
                    TLButton(title: "Log In", background: .blue) {
                        viewModel.login()
                    }
                    
                }
                .offset(y: -50)
                
                //MARK: - Create Account
                VStack{
                    Text("New Around here?")
                    NavigationLink("Create An Account", destination: RegisterView())
                }
                .padding(.bottom, 50)
                
                
                // Push Things up to Top
                Spacer()
            }
        }
    }
}

#Preview {
    LoginView()
}
