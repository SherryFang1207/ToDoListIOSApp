//
//  ContentView.swift
//  ToDoList
//
//  Created by 房子祺 on 12/1/23.
//

import SwiftUI
//Refresh Canvas: cmd opt P
// Switch light/dark mode: cmd shift A
struct MainView: View {
    @StateObject var viewModel = MainViewViewModel()
    var body: some View {
        if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty{
            // Signed In
            ToDoListView()
        }else{
            LoginView()
        }
    }
}

#Preview {
    MainView()
}
