//
//  RegisterView.swift
//  ToDoList
//
//  Created by 房子祺 on 12/1/23.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel = RegisterViewViewModel()
    var body: some View {
        VStack{
            //MARK: - Header
            HeaderView(title: "Register", subtitle: "Start organizing ToDos", angle: -15, background: .orange)
            //MARK: - Registration Form
            Form{
                TextField("Full Name", text: $viewModel.name)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                TextField("Email Address", text: $viewModel.email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                    .autocapitalization(.none)
                TextField("Password", text: $viewModel.password)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                TLButton(title: "Create Account", background: .green) {
                    // Register action
                    viewModel.register()
                }
            }
            .offset(y: -50)
            Spacer()
        }
        
    }
}

#Preview {
    RegisterView()
}
