//
//  DataStore.swift
//  Crate Custom Alert Object in SwiftUI
//
//  Created by Can Balkaya on 3/8/21.
//

import SwiftUI

class DataStore: ObservableObject {
    
    // MARK: - Properties
    static let shared = DataStore()
    @State var allTodoItems = TodoItem.example
    var incompleteTodoItems: [TodoItem] {
        return allTodoItems.filter { todoItem in
            !todoItem.completed
        }
    }
    var completedTodoItems: [TodoItem] {
        return allTodoItems.filter { todoItem in
            todoItem.completed
        }
    }
    @State var selectedTodoItem: TodoItem? = nil
    @State var newTodoItem: TodoItem? = nil
    @State var currentAction: Action? = nil
    @State var menuActions: [Action] = []
    
    // MARK: - Methods
    func setMenuActions() -> [Action] {
        if let selectedTodoItem = selectedTodoItem {
            if selectedTodoItem.completed {
                return [Action.actions.uncomplete, Action.actions.uncomplete, Action.actions.edit]
            } else {
                return [Action.actions.complete, Action.actions.uncomplete, Action.actions.edit]
            }
        } else {
            print("wpeofkwepokfwopef")
            return []
        }
    }
    
    func uncomplete() {
        print("Uncomplete method is run.")
    }
    
    func complete() {
        print("Complete method is run.")
    }
    
    func delete() {
        print("Delete method is run.")
//        actionType = .delete
//        todoItems.remove(atOffsets: offsets)
    }
    
    func edit() {
        print("Edit method is run.")
    }
    
    func create() {
        print("Create method is run.")
//        actionType = .create
//        todoItems.insert(todoItem, at: 0)
    }
}
