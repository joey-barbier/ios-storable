//
//  TodoRow.swift
//  ios-storable-demo
//
//  Created by Joey BARBIER on 27/06/2022.
//

import SwiftUI

// MARK: - Append new type of view
extension Todo {
    struct Row: View {
        @Binding var todo: Todo
        var tag: String
        
        @State private var isFav: Bool = false
        @State private var showingFlagChoices = false
    }
}

// MARK: - Body
extension Todo.Row {
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
                try? todo.storage.toggle(withTag: tag)
                isFav = todo.storage.isPresent(atTag: tag)
            } label: {
                if isFav {
                    Image(systemName: "star.fill")
                } else {
                    Image(systemName: "star")
                }
            }
        }
        .onAppear { [weak todo] in
            guard let todo = todo else {return}
            isFav = todo.storage.isPresent(atTag: tag)
        }
        .padding(.horizontal)
    }
}

struct TodoRow_Previews: PreviewProvider {
    static var previews: some View {
        let item: Todo = try! Todo.previewData()
        Todo.Row(todo: .constant(item), tag: "news")
    }
}
