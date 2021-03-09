//
//  Action.swift
//  Crate Custom Alert Object in SwiftUI
//
//  Created by Can Balkaya on 3/8/21.
//

import Foundation

struct Action {
    
    // MARK: - Enumaretions
    enum ActionType: String {
        case uncomplete = "Uncomplete"
        case complete = "Complete"
        case delete = "Delete"
        case edit = "Edit"
        case create = "Create"
    }
    
    // MARK: - Properties
    let actionType: ActionType
    let menuItemTitle: String?
    let alertTitle: String?
    let alertDescription: String?
    let action: () -> Void
    
    static let actions: (uncomplete: Action, complete: Action, delete: Action, edit: Action, create: Action) = (
        uncomplete:
            Action(actionType: .uncomplete, menuItemTitle: ActionType.uncomplete.rawValue, alertTitle: nil, alertDescription: nil, action: {
                print("")
            }),
        complete:
            Action(actionType: .complete, menuItemTitle: ActionType.complete.rawValue, alertTitle: nil, alertDescription: nil, action: {
                print("")
            }),
        delete:
            Action(actionType: .delete, menuItemTitle: ActionType.delete.rawValue, alertTitle: nil, alertDescription: nil, action: {
                print("")
            }),
        edit:
            Action(actionType: .edit, menuItemTitle: ActionType.edit.rawValue, alertTitle: nil, alertDescription: nil, action: {
                print("")
            }),
        create:
            Action(actionType: .create, menuItemTitle: ActionType.create.rawValue, alertTitle: nil, alertDescription: nil, action: {
                print("")
            })
    )
    
    static let inCompleteContextMenuActions: [Action] = [
//        Action(actionType: .complete, menuItemTitle: "Complete", alertTitle: nil, alertDescription: nil, action: { getComplete })
    ]
    
    func getComplete(todoItem: TodoItem) {
        if let index = DataStore.shared.allTodoItems.firstIndex(where: { $0.id == todoItem.id }) {
            DataStore.shared.allTodoItems[index].completed = true
        }
    }
}
