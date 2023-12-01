//
//  LoginViewViewModel.swift
//  ToDoList
//
//  Created by 房子祺 on 12/1/23.
//

import Foundation

class LoginViewViewModel : ObservableObject {
    @Published var email = ""
    @Published var passward = ""
    @Published var errorMessage = ""
    
    init(email: String = "", passward: String = "") {
        self.email = email
        self.passward = passward
    }
    
    func login(){
        errorMessage = ""
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty, !passward.trimmingCharacters(in: .whitespaces).isEmpty else{
            errorMessage = "Please fill in all fields!"
            return
        }
        guard email.contains("@") && email.contains(".") else {
            errorMessage = "Please enter valid email."
            return
        }
        print("Successfully received valid Login entries.")
    }
}
