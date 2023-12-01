//
//  LoginView.swift
//  ToDoList
//
//  Created by 房子祺 on 12/1/23.
//

import SwiftUI

struct LoginView: View {
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        NavigationView {
            
            VStack{
                //MARK: - Header
                HeaderView(title: "To Do List", subtitle: "Get things done", angle: 15, background: .pink)
                //MARK: - Login Form
                Form{
                    TextField("Email Address", text: $email).textFieldStyle(DefaultTextFieldStyle())
                        .autocorrectionDisabled()
                        .autocapitalization(.none)
                    TextField("PassWord", text: $password)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocorrectionDisabled()
                        .autocapitalization(.none)
                    
                    TLButton(title: "Log In", background: .blue, action: {
                        // Log in Action
                    })
                    
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
