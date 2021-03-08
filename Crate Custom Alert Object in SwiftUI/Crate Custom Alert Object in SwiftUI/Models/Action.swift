//
//  Action.swift
//  Crate Custom Alert Object in SwiftUI
//
//  Created by Can Balkaya on 3/8/21.
//

import Foundation

struct Action {
    
    // MARK: - Enumaretions
    enum ActionType {
        case uncomplete
        case complete
        case delete
        case edit
        case create
    }
    
    // MARK: - Properties
    let actionType: ActionType
    let menuItemTitle: String?
    let alertTitle: String?
    let alertDescription: String?
    let action: () -> Void
    
    static let actions: [Action] = [
        Action(actionType: .uncomplete, menuItemTitle: "Uncomplete", alertTitle: nil, alertDescription: nil, action: {
            print("pwkfpo")
        })
    ]
    
    static let inCompleteContextMenuActions: [Action] = [
        Action(actionType: .complete, menuItemTitle: "Complete", alertTitle: nil, alertDescription: nil, action: { getComplete })
    ]
    
    func getComplete(todoItem: TodoItem) {
        if let index = DataStore.shared.allTodoItems.firstIndex(where: { $0.id == todoItem.id }) {
            DataStore.shared.allTodoItems[index].completed = true
        }
    }
}
