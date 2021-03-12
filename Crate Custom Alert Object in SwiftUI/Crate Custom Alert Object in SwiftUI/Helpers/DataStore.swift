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
    @Published var allTodoItems = TodoItem.example
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
    @Published var currentAction: Action? = nil
    @State var menuActions: [Action] = []
    
    // MARK: - Methods
    private func getSelectedTodoItemIndex(selected todoItem: TodoItem) -> Int {
        allTodoItems.firstIndex(where: { $0.id == todoItem.id })!
    }
    
    func getMenuItemsTexts(selected todoItem: TodoItem) -> [String] {
        var actions: [Action] {
            if todoItem.completed {
                return [Action.actions.uncomplete, Action.actions.delete, Action.actions.edit]
            } else {
                return [Action.actions.complete, Action.actions.delete, Action.actions.edit]
            }
        }
        
        var menuItemsTexts: [String]!
        for action in actions {
            menuItemsTexts.insert(action.menuItemTitle!, at: 0)
        }
        
        return menuItemsTexts
    }
    
    func uncomplete(_ todoItem: TodoItem) {
        allTodoItems[getSelectedTodoItemIndex(selected: todoItem)].completed = false
    }
    
    func complete(_ todoItem: TodoItem) {
        allTodoItems[getSelectedTodoItemIndex(selected: todoItem)].completed = true
    }
    
    func delete(_ todoItem: TodoItem) {
        allTodoItems.remove(at: getSelectedTodoItemIndex(selected: todoItem))
    }
    
    func edit(_ todoItem: TodoItem, newTodoItem: TodoItem) {
        allTodoItems[getSelectedTodoItemIndex(selected: todoItem)] = newTodoItem
    }
    
    func create(_ todoItem: TodoItem) {
        allTodoItems.insert(todoItem, at: 0)
    }
}
