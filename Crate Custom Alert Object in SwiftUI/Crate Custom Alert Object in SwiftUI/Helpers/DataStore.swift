//
//  DataStore.swift
//  Crate Custom Alert Object in SwiftUI
//
//  Created by Can Balkaya on 3/8/21.
//

import SwiftUI

class DataStore: ObservableObject {
    
    // MARK: - Enumaretions
    enum ActionType {
        case uncomplete
        case complete
        case delete
        case edit
        case create
    }
    
    // MARK: - Properties
    static let shared = DataStore()
    @Published var todoItems = TodoItem.example
    @State var actionType: ActionType? = nil
    let menuActionTypes: [ActionType] = [.delete, .edit]
    
    // MARK: - Methods
    func delete(_ offsets: IndexSet) {
        actionType = .delete
//        todoItems.remove(atOffsets: offsets)
    }
    
    func edit() {
        
    }
    
    func create(todoItem: TodoItem) {
        actionType = .create
//        todoItems.insert(todoItem, at: 0)
    }
}

extension DataStore.ActionType: RawRepresentable {
    typealias RawValue = (String, String?)

    init?(rawValue: (String, String?)) {
        switch rawValue {
        case ("Delete item", "After you delete this item, you won't be able to access this item again."): self = .delete
        case ("Edit item", "After making changes to this item, ou cannot undo these changes."): self = .edit
        case ("Create a new item", nil): self = .create
        default: return nil
        }
    }

    var rawValue: (String, String?) {
        switch self {
        case .delete: return ("Delete item", "After you delete this item, you won't be able to access this item again.")
        case .edit: return ("Edit item", "After making changes to this item, ou cannot undo these changes.")
        case .create: return ("Create a new item", nil)
        case .uncomplete: return ("Delete item", "After you delete this item, you won't be able to access this item again.")
        case .complete: return ("Delete item", "After you delete this item, you won't be able to access this item again.")
        }
    }
}
