//
//  ContentView.swift
//  ios-storable-demo
//
//  Created by Joey BARBIER on 27/06/2022.
//

import SwiftUI

extension Views {
    struct Home: View {
        @State private var todos: Todos = []
        @State private var todosFav: Todos = []
    }
}

extension Views.Home {
    var body: some View {
        TabView {
            Todo.List(todos: $todos)
                .task {
                    getData()
                }
                .tabItem({
                    Image(systemName: "list.dash")
                    Text("all")
                })
            
            Todo.List(todos: $todosFav, tag: "favoris")
                .onAppear {
                    todosFav = Todo.restore.find(byTag: "favoris")
                    for todo in todosFav {
                        print("todo_id: \(todo.id)")
                    }
                }
                .tabItem({
                    VStack {
                        Image(systemName: "list.star")
                        Text("fav")
                    }
                })
            
            Todo.List(todos: $todosFav, tag: "news")
                .onAppear {
                    todosFav = Todo.restore.find(byTag: "news")
                    for todo in todosFav {
                        print("todo_id: \(todo.id)")
                    }
                }
                .tabItem({
                    VStack {
                        Image(systemName: "flame.fill")
                        Text("News")
                    }
                })
        }
    }
}

extension Views.Home {
    private func getData() {
        self.todos = try! Todo.previewData()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Views.Home()
    }
}
