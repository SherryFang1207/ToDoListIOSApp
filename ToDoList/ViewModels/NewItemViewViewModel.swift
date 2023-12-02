//
//  NewItemViewViewModel.swift
//  ToDoList
//
//  Created by 房子祺 on 12/1/23.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore
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
        guard canSave else {
            print("Error: New Item didn't meet creation requirements.")
            return
        }
        // Get Current User Id
        guard let uId = Auth.auth().currentUser?.uid else {
            print("Error: Could not retrieve current user Id")
            return
        }
        
        // Create Item Data Model
        let newId = UUID().uuidString
        let newItem = ToDoListItem(id: newId, title: title, dueDate: dueDate.timeIntervalSince1970, createdDate: Date().timeIntervalSince1970, isDone: false)
        
        // Save Data Model to Firebase DB
        let db = Firestore.firestore()
        db.collection("users")
            .document(uId)
            .collection("todos")
            .document(newId)
            .setData(newItem.asDictionary())
        
    }
}
