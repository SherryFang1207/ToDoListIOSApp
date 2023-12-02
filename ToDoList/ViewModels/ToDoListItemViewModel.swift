//
//  ToDoListItemViewModel.swift
//  ToDoList
//
//  Created by 房子祺 on 12/1/23.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore
/// ViewModel for single ToDo list Item View (each row in items list)
class ToDoListItemViewModel : ObservableObject {
    init() {
        
    }
    func toggleIsDone(item : ToDoListItem){
        var itemCopy = item
        itemCopy.setDone(!item.isDone)
        
        guard let uid = Auth.auth().currentUser?.uid else{
            print("Error: Failed to get userId when toggleIsDone")
            return
        }
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(uid)
            .collection("todos")
            .document(itemCopy.id)
            .setData(itemCopy.asDictionary())
    }
}
