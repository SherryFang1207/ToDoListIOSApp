//
//  ToDoListItemsView.swift
//  ToDoList
//
//  Created by 房子祺 on 12/1/23.
//

import SwiftUI
import FirebaseFirestore
import FirebaseFirestoreSwift
struct ToDoListView: View {
    @StateObject var viewModel : ToDoListViewViewModel
    @FirestoreQuery var items : [ToDoListItem]
    
    var userId : String
    init(userId : String){
        self.userId = userId
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/todos")
        self._viewModel = StateObject(wrappedValue: ToDoListViewViewModel(userId: userId))
    }
    var body: some View {
        NavigationView {
            VStack {
                //MARK: - Add Swipe Animation using cocoapods
                List(items){
                    item in ToDoListItemView(item: item)
                        .swipeActions{
                            Button(action: {
                                // delete cur Todo
                                viewModel.delete(id: item.id)
                            }, label: {
                                Text("Delete")
                                    
                            }).tint(.red)
                        }
                }
                .listStyle(PlainListStyle())
                
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
    ToDoListView(userId: "TG6QduGDJBXN2GniD3PkW9L1ibf1")
}
