//
//  NewItemView.swift
//  ToDoList
//
//  Created by 房子祺 on 12/1/23.
//

import SwiftUI

struct NewItemView: View {
    @StateObject var viewModel = NewItemViewViewModel()
    @Binding var newItemPresented : Bool
    var body: some View {
        VStack{
            Text("New Item")
                .font(.system(size: 32))
                .bold()
                .padding(.top, 60)
                .padding(.bottom,40)
            Form{
                // Title
                TextField("Title", text: $viewModel.title)
                    .textFieldStyle(DefaultTextFieldStyle())
                // Due Date
                DatePicker("Due Date", selection: $viewModel.dueDate).datePickerStyle(GraphicalDatePickerStyle())
                // Button
                TLButton(title: "Save", background: .pink) {
                    if viewModel.canSave {
                        viewModel.save()
                        newItemPresented = false
                    } else {
                        viewModel.showAlert = true
                    }
                }.padding()
            }
            .alert(isPresented: $viewModel.showAlert) {
                Alert(title: Text("Item Creation Error"),
                      message: Text("Please fill in all fields and select due date no earlier than today."),
                      dismissButton: .default(Text("OK")))
            }

        }
    }
}

#Preview {
    NewItemView(newItemPresented: Binding(get: {
        return true
    }, set: {
        _ in
    }))
}
