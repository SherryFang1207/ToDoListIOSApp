//
//  LoginViewViewModel.swift
//  ToDoList
//
//  Created by 房子祺 on 12/1/23.
//

import Foundation
import FirebaseAuth

class LoginViewViewModel : ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    init(email: String = "", password: String = "") {
        self.email = email
        self.password = password
    }
    
    func login(){
        guard validate() else {
            return
        }
        // Try log in using Firebase Auth
        Auth.auth().signIn(withEmail: email, password: password)
    }
    
    private func validate() -> Bool{
        errorMessage = ""
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty, !password.trimmingCharacters(in: .whitespaces).isEmpty else{
            errorMessage = "Please fill in all fields!"
            return false
        }
        guard email.contains("@") && email.contains(".") else {
            errorMessage = "Please enter valid email."
            return false
        }
        print("Successfully received valid Login entries.")
        return true
    }
}
