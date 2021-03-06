//
//  TodoItem.swift
//  Crate Custom Alert Object in SwiftUI
//
//  Created by Can Balkaya on 3/7/21.
//

import UIKit

struct TodoItem: Identifiable {
    
    // MARK: - Enumerations
    enum Priority: CaseIterable {
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
    var priority: Priority?
    var date: Date
    var completed = false
    
    static let example = [
        TodoItem(title: "Go to Apple Store!", description: "Buy a new iPhone 12 Pro Max.", priority: .urgent, date: Date().daysAdded(5), completed: false),
        TodoItem(title: "Make some coffee. ☕️", description: "At 12pm, I must drink a latte.", priority: .high, date: Date().daysAdded(3), completed: false),
        TodoItem(title: "Look the mail boxes", description: "Mail boxes", priority: .high, date: Date().daysAdded(-2), completed: true),
        TodoItem(title: "Watch documentary", description: "I want to watch ", priority: .low, date: Date().daysAdded(-5), completed: true),
        TodoItem(title: "Read book", description: "I want to read B. Obama's new book.", priority: .normal, date: Date().daysAdded(1), completed: false)
    ]
}

extension TodoItem.Priority: RawRepresentable {
    typealias RawValue = (name: String, color: UIColor)

    init?(rawValue: RawValue) {
        switch rawValue {
        case (name: "Urgent", color: UIColor.red): self = .urgent
        case (name: "High", color: UIColor.orange): self = .high
        case (name: "Normal", color: UIColor.blue): self = .normal
        case (name: "Low", color: UIColor.gray): self = .low
        default: return nil
        }
    }

    var rawValue: RawValue {
        switch self {
        case .urgent: return (name: "Urgent", color: UIColor.red)
        case .high: return (name: "High", color: UIColor.orange)
        case .normal: return (name: "Normal", color: UIColor.blue)
        case .low: return (name: "Low", color: UIColor.gray)
        }
    }
}
