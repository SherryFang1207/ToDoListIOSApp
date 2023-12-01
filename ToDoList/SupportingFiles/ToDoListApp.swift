//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by 房子祺 on 12/1/23.
//

import SwiftUI
import FirebaseCore
@main
struct ToDoListApp: App {
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
