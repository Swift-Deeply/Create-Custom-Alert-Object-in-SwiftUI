//
//  DataStore.swift
//  Crate Custom Alert Object in SwiftUI
//
//  Created by Can Balkaya on 3/8/21.
//

import SwiftUI

class DataStore: ObservableObject {
    
    // MARK: - Enumaretions
    enum ActionType: String {
        case delete = "Delete item"
        case edit = "Edit item"
        case create = "Create a new item"
    }
    
    // MARK: - Properties
    static let shared = DataStore()
    @Published var todoItems = TodoItem.example
    @State var actionType: ActionType? = nil
    let actionTypes: [ActionType] = [.delete, .edit, .create]
    
    // MARK: - Methods
    func delete(_ offsets: IndexSet) {
        actionType = .delete
//        todoItems.remove(atOffsets: offsets)
    }
    
    func create(todoItem: TodoItem) {
        actionType = .create
//        todoItems.insert(todoItem, at: 0)
    }
}
