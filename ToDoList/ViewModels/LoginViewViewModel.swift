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
    
    init(email: String = "", passward: String = "") {
        self.email = email
        self.passward = passward
    }
}
