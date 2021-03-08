//
//  Date+Ext.swift
//  Crate Custom Alert Object in SwiftUI
//
//  Created by Can Balkaya on 3/8/21.
//

import Foundation

extension Date {
    
    // MARK: - Methods
    func daysAdded(_ days: Int) -> Date {
        return Calendar.current.date(byAdding: .day, value: days, to: self)!
    }
    
    func dateString(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE, MMM d"
        return dateFormatter.string(from: date)
    }
}
