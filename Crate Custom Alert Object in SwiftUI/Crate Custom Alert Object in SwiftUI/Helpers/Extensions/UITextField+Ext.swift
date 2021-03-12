//
//  UITextField+Ext.swift
//  Crate Custom Alert Object in SwiftUI
//
//  Created by Can Balkaya on 3/12/21.
//

import UIKit

extension UITextField {
    func datePicker<T>(target: T, date: Date, doneAction: Selector, cancelAction: Selector, datePickerMode: UIDatePicker.Mode = .date) {
        let screenWidth = UIScreen.main.bounds.width
        
        func buttonItem(withSystemItemStyle style: UIBarButtonItem.SystemItem) -> UIBarButtonItem {
            let buttonTarget = style == .flexibleSpace ? nil : target
            let action: Selector? = {
                switch style {
                case .cancel:
                    return cancelAction
                case .done:
                    return doneAction
                default:
                    return nil
                }
            }()
            
            let barButtonItem = UIBarButtonItem(barButtonSystemItem: style, target: buttonTarget, action: action)
            return barButtonItem
        }
        
        let datePicker = UIDatePicker(frame: CGRect(x: 0, y: 0, width: screenWidth, height: 216))
        datePicker.date = date
        datePicker.datePickerMode = datePickerMode
        datePicker.preferredDatePickerStyle = .wheels
        self.inputView = datePicker
        
        let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: screenWidth, height: 44))
        toolBar.setItems([buttonItem(withSystemItemStyle: .cancel), buttonItem(withSystemItemStyle: .flexibleSpace), buttonItem(withSystemItemStyle: .done)], animated: true)
        self.inputAccessoryView = toolBar
    }
}
