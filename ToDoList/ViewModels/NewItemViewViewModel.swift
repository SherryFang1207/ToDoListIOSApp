//
//  NewItemViewViewModel.swift
//  ToDoList
//
//  Created by 房子祺 on 12/1/23.
//

import Foundation
class NewItemViewViewModel : ObservableObject {
    @Published var title = ""
    @Published var dueDate = Date()
    @Published var showAlert = false
    
    var canSave : Bool {
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        guard dueDate >= Date().addingTimeInterval(-86400) else {
            return false
        }
        return true
    }
    init() {
        
    }
    func save(){
        
    }
}
