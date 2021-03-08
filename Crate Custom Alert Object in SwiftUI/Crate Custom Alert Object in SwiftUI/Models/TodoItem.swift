//
//  TodoItem.swift
//  Crate Custom Alert Object in SwiftUI
//
//  Created by Can Balkaya on 3/7/21.
//

import UIKit

struct TodoItem: Identifiable {
    
    enum Priority {
        case urgent
        case high
        case normal
        case low
    }
    
    // MARK: - Properties
    var id = UUID()
    var title: String
    var description: String?
    var priority: Priority
    
    static let example = [
        TodoItem(title: "Go to Apple Store!", description: "Buy a new iPhone 12 Pro Max.", priority: .urgent),
        TodoItem(title: "Make some coffee. ☕️", description: "At 12pm, I must drink a latte.", priority: .high),
        TodoItem(title: "Look the mail boxes", description: "Mail boxes", priority: .high),
        TodoItem(title: "Watch documentary", description: "I want to watch ", priority: .low),
        TodoItem(title: "Read book", description: "I want to read B. Obama's new book.", priority: .normal)
    ]
}

extension TodoItem.Priority: RawRepresentable {
    typealias RawValue = UIColor

    init?(rawValue: RawValue) {
        switch rawValue {
        case UIColor.red: self = .urgent
        case UIColor.yellow: self = .high
        case UIColor.blue: self = .normal
        case UIColor.gray: self = .low
        default: return nil
        }
    }

        var rawValue: RawValue {
            switch self {
            case .urgent: return UIColor.red
            case .high: return UIColor.yellow
            case .normal: return UIColor.blue
            case .low: return UIColor.gray
        }
    }
}
