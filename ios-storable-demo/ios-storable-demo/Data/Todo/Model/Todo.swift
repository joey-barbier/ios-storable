//
//  Todo.swift
//  ios-storable-demo
//
//  Created by Joey BARBIER on 27/06/2022.
//

import Foundation
import OrkaStorable
import OrkaPreviewData

typealias Todos = [Todo]

// MARK: - This model can be saved in CoreData
final class Todo: Stockable {
    var id: Int
    var title: String
    var completed: Bool
}

extension Todo: PreviewData {}

extension Todo: Equatable {
    static func == (lhs: Todo, rhs: Todo) -> Bool {
        return lhs.id == rhs.id
    }
}
