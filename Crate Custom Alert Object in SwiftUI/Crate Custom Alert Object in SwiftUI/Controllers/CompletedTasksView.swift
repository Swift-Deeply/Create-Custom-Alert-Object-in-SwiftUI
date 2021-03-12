//
//  CompletedTasksView.swift
//  Crate Custom Alert Object in SwiftUI
//
//  Created by Can Balkaya on 3/8/21.
//

import SwiftUI

struct CompletedTasksView: View {
    
    // MARK: - Properties
    @ObservedObject var dataStore = DataStore.shared
    @Environment(\.presentationMode) var presentationMode
    
    // MARK: - UI Elements
    var body: some View {
        NavigationView {
            List {
                ForEach(dataStore.completedTodoItems) { todoItem in
                    ListCellView(todoItem: todoItem, alertShowing: $dataStore.alertShowing)
                }
            }
            .listStyle(InsetGroupedListStyle())
            .navigationTitle("Completed Tasks")
            .navigationBarItems(trailing: Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                Text("Done")
            })
            .textFieldAlert(isPresented: $dataStore.alertShowing) {
                TextFieldAlert(action: dataStore.currentAction!)
            }
        }
    }
}

struct CompletedTasksView_Previews: PreviewProvider {
    static var previews: some View {
        CompletedTasksView()
    }
}
