//
//  ToDoItem.swift
//  ToDoList
//
//  Created by 房子祺 on 12/1/23.
//

import Foundation

struct ToDoListItem : Codable, Identifiable {
    let id : String
    let title : String
    let dueDate : TimeInterval
    let createdDate : TimeInterval
    var isDone : Bool
    
    mutating func setDone(_ state: Bool){
        isDone = state
    }
}
