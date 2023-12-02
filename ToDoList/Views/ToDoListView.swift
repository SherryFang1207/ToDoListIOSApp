//
//  ToDoListItemsView.swift
//  ToDoList
//
//  Created by 房子祺 on 12/1/23.
//

import SwiftUI

struct ToDoListView: View {
    @StateObject var viewModel = ToDoListViewViewModel()
    var userId : String
    init(userId : String){
        self.userId = userId
    }
    var body: some View {
        NavigationView {
            VStack {
                
            }.navigationTitle("To Do List")
                .toolbar {
                    Button(action: {
                        viewModel.showingNewItemView = true
                    }, label: {
                        Image(systemName: "plus")
                    })
                }.sheet(isPresented: $viewModel.showingNewItemView, content: {
                    NewItemView(newItemPresented: $viewModel.showingNewItemView)
                })
        }
    }
}

#Preview {
    ToDoListView(userId: "")
}
