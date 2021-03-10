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
    private func presentAlertController() {
        guard subscription == nil else { return }
        let ac = UIAlertController(title: action.alertTitle, message: action.alertDescription, preferredStyle: .alert)
        
        ac.view.tintColor = .red
        
        ac.addTextField()
        ac.addTextField()
        ac.textFields![0].placeholder = "Title"
        ac.textFields![0].keyboardType = .numberPad
        ac.textFields![1].placeholder = "Description"
        ac.textFields![1].keyboardType = .numberPad

        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { [weak self] _ in
            self?.isPresented?.wrappedValue = false
        }
//        let createAction = UIAlertAction(title: "Create", style: .default) { [unowned ac] _ in
//            let title = ac.textFields![0].text!
//            let description = ac.textFields![1].text!
//            let note = Note(title: title, description: description)
//
//            DataProvider.shared.create(note: note)
//        }
        
        ac.addAction(cancelAction)
//        ac.addAction(createAction)
        present(ac, animated: true, completion: nil)
    }
}

extension TextFieldAlertViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 0
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 0
    }
}
