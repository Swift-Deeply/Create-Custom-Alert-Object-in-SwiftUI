//
//  TodoItem.swift
//  Crate Custom Alert Object in SwiftUI
//
//  Created by Can Balkaya on 3/7/21.
//

import UIKit

struct TodoItem: Identifiable {
    
    enum Priority: String, CaseIterable {
        case urgent
        case high
        case normal
        case low
        
        static let all = Priority.allCases
    }
    
    // MARK: - Properties
    var id = UUID()
    var title: String
    var description: String?
    var priority: Priority
    var completed = false
    var date: Date
    
    static let example = [
        TodoItem(title: "Go to Apple Store!", description: "Buy a new iPhone 12 Pro Max.", priority: .urgent, completed: false, date: Date().daysAdded(5)),
        TodoItem(title: "Make some coffee. ☕️", description: "At 12pm, I must drink a latte.", priority: .high, completed: false, date: Date().daysAdded(3)),
        TodoItem(title: "Look the mail boxes", description: "Mail boxes", priority: .high, completed: true, date: Date().daysAdded(-2)),
        TodoItem(title: "Watch documentary", description: "I want to watch ", priority: .low, completed: true, date: Date().daysAdded(-5)),
        TodoItem(title: "Read book", description: "I want to read B. Obama's new book.", priority: .normal, completed: false, date: Date().daysAdded(1))
    ]
}

extension TodoItem.Priority: RawRepresentable {
    typealias RawValue = (String, UIColor)

    init?(rawValue: RawValue) {
        switch rawValue {
        case ("Urgent", UIColor.red): self = .urgent
        case ("High", UIColor.yellow): self = .high
        case ("Normal", UIColor.blue): self = .normal
        case ("Low", UIColor.gray): self = .low
        default: return nil
        }
    }

        var rawValue: RawValue {
            switch self {
            case .urgent: return ("Urgent", UIColor.red)
            case .high: return ("High", UIColor.yellow)
            case .normal: return ("Normal", UIColor.blue)
            case .low: return ("Low", UIColor.gray)
        }
    }
}
