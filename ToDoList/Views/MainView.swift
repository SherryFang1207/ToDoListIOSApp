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
            // User Session found: Display Signed-In TodoList Page
            accountView

        }else{
            // No User Session found: Display Log-in page
            LoginView()
        }
    }
    
    @ViewBuilder
    var accountView : some View{
        TabView{
            ToDoListView(userId: viewModel.currentUserId).tabItem { Label("Home", systemImage: "house") }
            ProfileView().tabItem { Label("Profile", systemImage: "person.circle") }
        }
    }
}

#Preview {
    MainView()
}
