//
//  TodoItem.swift
//  Crate Custom Alert Object in SwiftUI
//
//  Created by Can Balkaya on 3/7/21.
//

import UIKit

struct TodoItem {
    
    enum Priority {
        case urgent
        case high
        case normal
        case low
    }
    
    // MARK: - Properties
    var title: String
    var description: String?
    var priority: Priority
    
    static let example = [
        TodoItem(title: "Go to Apple Store!", description: "Buy a new iPhone 12 Pro Max.", priority: .urgent),
        TodoItem(title: "Go to Apple Store!", description: "Buy a new iPhone 12 Pro Max.", priority: .high)
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
