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
    
    // MARK: - UI Elements
    var body: some View {
        NavigationView {
            List {
                ForEach(dataStore.completedTodoItems) { todoItem in
                    ListCellView(todoItem: todoItem)
                }
            }
        }
    }
}

struct CompletedTasksView_Previews: PreviewProvider {
    static var previews: some View {
        CompletedTasksView()
    }
}
