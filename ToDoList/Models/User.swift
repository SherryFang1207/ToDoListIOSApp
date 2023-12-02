//
//  User.swift
//  ToDoList
//
//  Created by 房子祺 on 12/1/23.
//

import Foundation

struct User : Codable {
    let id : String
    let name : String
    let email : String
    let joined : TimeInterval
}
