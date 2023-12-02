//
//  ToDoListViewViewModel.swift
//  ToDoList
//
//  Created by 房子祺 on 12/1/23.
//

import Foundation
import FirebaseFirestore
class ToDoListViewViewModel : ObservableObject {
    @Published var showingNewItemView = false
    private let userId : String
    
    init(userId : String) {
        self.userId = userId
    }
    
    /// Delete a ToDo of specified id
    /// - Parameter id: ToDo Item Id
    func delete(id : String){
        let db = Firestore.firestore()
        db.collection("users")
            .document(self.userId)
            .collection("todos")
            .document(id)
            .delete()
    }
}
