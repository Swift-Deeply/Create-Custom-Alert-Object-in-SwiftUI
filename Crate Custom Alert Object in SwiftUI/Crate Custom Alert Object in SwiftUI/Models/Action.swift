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
    
    static let actions: (uncomplete: Action, complete: Action, delete: Action, edit: Action, create: Action) = (
        uncomplete:
            Action(actionType: .uncomplete, menuItemTitle: "Uncomplete", alertTitle: ActionType.uncomplete.rawValue, alertDescription: "Are "),
        complete:
            Action(actionType: .complete, menuItemTitle: "Complete", alertTitle: ActionType.complete.rawValue, alertDescription: "After you delete this item, you won't be able to access this item again."),
        delete:
            Action(actionType: .delete, menuItemTitle: "Delete", alertTitle: ActionType.delete.rawValue, alertDescription: nil),
        edit:
            Action(actionType: .edit, menuItemTitle: "Edit", alertTitle: ActionType.edit.rawValue, alertDescription: "After making changes to this item, ou cannot undo these changes."),
        create:
            Action(actionType: .create, menuItemTitle: nil, alertTitle: ActionType.create.rawValue, alertDescription: nil)
    )
}
