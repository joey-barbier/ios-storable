//
//  TodoRow.swift
//  ios-storable-demo
//
//  Created by Joey BARBIER on 27/06/2022.
//

import SwiftUI

// MARK: - Append new type of view
extension Todo {
    struct RowAdd: View {
        @Binding var todo: Todo
        @State private var showingFlagChoices = false
    }
}

// MARK: - Body
extension Todo.RowAdd {
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("\(todo.title)")
                    .font(.body)
                Text("\(todo.id) !")
                    .font(.subheadline)
            }
            Spacer()
            
            Button {
                showingFlagChoices = true
            } label: {
                Image(systemName: "plus.circle.fill")
            }
            .actionSheet(isPresented: $showingFlagChoices) {
                ActionSheet(
                    title: Text("Choice a tag :"),
                    buttons: [
                        .default(Text("news")) {
                            buttonPressed(withTag: "news")
                        },
                        .default(Text("favoris")) {
                            buttonPressed(withTag: "favoris")
                        },
                        .cancel()
                    ]
                )
            }
        }
        .padding(.horizontal)
    }
}

extension Todo.RowAdd {
    func buttonPressed(withTag tag: String) {
        try? todo.storage.add(withTag: tag)
    }
}

struct TodoRowAdd_Previews: PreviewProvider {
    static var previews: some View {
        let item: Todo = try! Todo.previewData()
        Todo.RowAdd(todo: .constant(item))
    }
}
