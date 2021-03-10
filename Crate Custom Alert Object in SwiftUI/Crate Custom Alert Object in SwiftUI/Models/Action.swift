//
//  Action.swift
//  Crate Custom Alert Object in SwiftUI
//
//  Created by Can Balkaya on 3/8/21.
//

import SwiftUI

struct Action: Identifiable {
    
    // MARK: - Enumaretions
    enum ActionType: String {
        case uncomplete = "Uncomplete item"
        case complete = "Complete item"
        case delete = "Delete item"
        case edit = "Edit item"
        case create = "Create a new item"
    }
    
    // MARK: - Properties
    var id = UUID()
    let actionType: ActionType
    let menuItemTitle: String?
    let alertTitle: String?
    let alertDescription: String?
    let action: () -> Void
    
    static let actions: (uncomplete: Action, complete: Action, delete: Action, edit: Action, create: Action) = (
        uncomplete:
            Action(actionType: .uncomplete, menuItemTitle: "Uncomplete", alertTitle: ActionType.uncomplete.rawValue, alertDescription: "Are ", action: {
//                DataStore.shared.allTodoItems
            }),
        complete:
            Action(actionType: .complete, menuItemTitle: "Complete", alertTitle: ActionType.complete.rawValue, alertDescription: "After you delete this item, you won't be able to access this item again.", action: {
                print("")
            }),
        delete:
            Action(actionType: .delete, menuItemTitle: "Delete", alertTitle: ActionType.delete.rawValue, alertDescription: nil, action: {
                print("")
            }),
        edit:
            Action(actionType: .edit, menuItemTitle: "Edit", alertTitle: ActionType.edit.rawValue, alertDescription: "After making changes to this item, ou cannot undo these changes.", action: {
                print("")
            }),
        create:
            Action(actionType: .create, menuItemTitle: nil, alertTitle: ActionType.create.rawValue, alertDescription: nil, action: {
                DataStore.shared.create()
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
