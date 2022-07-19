//
//  TodoList.swift
//  ios-storable-demo
//
//  Created by Joey BARBIER on 27/06/2022.
//

import SwiftUI

// MARK: - Append new type of view
extension Todo {
    struct List: View {
        @Binding var todos: Todos
        var tag: String?
    }
}

// MARK: - List
extension Todo.List {
    var body: some View {
        List($todos) { todo in
            if let tag = tag {
                Todo.Row(todo: todo, tag: tag)
            } else {
                Todo.RowAdd(todo: todo)
            }
        }
    }
}

struct TodoList_Previews: PreviewProvider {
    static var previews: some View {
        let items: Todos = try! Todo.previewData()
        Todo.List(todos: .constant(items))
    }
}
