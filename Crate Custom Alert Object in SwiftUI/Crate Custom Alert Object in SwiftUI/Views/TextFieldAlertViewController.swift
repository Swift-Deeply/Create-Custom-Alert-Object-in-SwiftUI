//
//  TextFieldAlertViewController.swift
//  Crate Custom Alert Object in SwiftUI
//
//  Created by Can Balkaya on 3/7/21.
//

import SwiftUI
import Combine
import UIKit

class TextFieldAlertViewController: UIViewController {

    // MARK: - Properties
    private let action: Action
    private var isPresented: Binding<Bool>?

    private var subscription: AnyCancellable?
    
    let pickerViewComponents = TodoItem.Priority.allCases
    
    lazy var pickerView = UIPickerView()
    lazy var alertController = UIAlertController(title: action.alertTitle, message: action.alertDescription, preferredStyle: .alert)
    
    // MARK: - Life Cycle
    init(action: Action, isPresented: Binding<Bool>?) {
        self.action = action
        self.isPresented = isPresented
        
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        presentAlertController()
    }

    // MARK: - Methods
    @objc func cancelAction() {
        alertController.textFields![3].resignFirstResponder()
    }

    @objc func doneAction() {
        if let datePickerView = alertController.textFields![3].inputView as? UIDatePicker {
            alertController.textFields![3].text = Date().dateString(date: datePickerView.date)
            alertController.textFields![3].resignFirstResponder()
        }
    }
    
    private func presentAlertController() {
        guard subscription == nil else { return }
        
        if action.actionType == .edit || action.actionType == .create {
            alertController.addTextField()
            alertController.addTextField()
            alertController.addTextField()
            alertController.addTextField()
            alertController.textFields![0].placeholder = "Title"
            alertController.textFields![0].keyboardType = .numberPad
            alertController.textFields![1].placeholder = "Description"
            alertController.textFields![1].keyboardType = .numberPad
            alertController.textFields![2].placeholder = "Priority"
            alertController.textFields![2].inputView = pickerView
            alertController.textFields![3].placeholder = "Date"
            alertController.textFields![3].datePicker(target: self, doneAction: #selector(doneAction))
        }
        
        if action.actionType == .edit {
            alertController.textFields![0].text = action.todoItem?.title
            alertController.textFields![1].text = action.todoItem?.description
            alertController.textFields![2].text = action.todoItem?.priority.rawValue.0
        }

        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { [weak self] _ in
            self?.isPresented?.wrappedValue = false
        }
        let completeAction = UIAlertAction(title: "Complete", style: .default) { [self] _ in
            withAnimation {
                DataStore.shared.complete(action.todoItem!)
            }
        }
        let uncompleteAction = UIAlertAction(title: "Uncomplete", style: .default) { [self] _ in
            withAnimation {
                DataStore.shared.uncomplete(action.todoItem!)
            }
        }
        let deleteAction = UIAlertAction(title: "Delete", style: .default) { [self] _ in
            withAnimation {
                DataStore.shared.delete(action.todoItem!)
            }
        }
        let editAction = UIAlertAction(title: "Edit", style: .default) { [self] _ in
            let title = alertController.textFields![0].text
            let description = alertController.textFields![1].text
            let priority = TodoItem.Priority.allCases.filter { $0.rawValue.0 == alertController.textFields![2].text }
            let newTodoItem = TodoItem(title: title!, description: description, priority: priority[0], date: Date())
            
            withAnimation {
                DataStore.shared.edit(action.todoItem!, newTodoItem: newTodoItem)
            }
        }
        
        alertController.addAction(cancelAction)
        if action.actionType == .complete {
            alertController.addAction(completeAction)
        } else if action.actionType == .uncomplete {
            alertController.addAction(uncompleteAction)
        } else if action.actionType == .delete {
            alertController.addAction(deleteAction)
        } else if action.actionType == .edit {
            alertController.addAction(editAction)
        }

        DataStore.shared.alertShowing = false
        present(alertController, animated: true, completion: nil)
    }
}

extension TextFieldAlertViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    override func viewDidLoad() {
        super.viewDidLoad()

        pickerView.delegate = self
        pickerView.dataSource = self
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerViewComponents.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        pickerViewComponents[row].rawValue.0
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        alertController.textFields![2].text = pickerViewComponents[row].rawValue.0
    }
}
