//
//  TLButton.swift
//  ToDoList
//
//  Created by 房子祺 on 12/1/23.
//

import SwiftUI

struct TLButton: View {
    let title : String
    let background : Color
    let action : () -> Void // Closure
    var body: some View {
        Button{
            // Attempt to log in
            action()
        } label: {
            ZStack{
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(background)
                Text(title)
                    .foregroundColor(Color.white)
                    .bold()
            }
        }
        .padding()
    }
}

#Preview {
    TLButton(title: "Button Title", background: .blue) {
        // resgistration action
    }
}
