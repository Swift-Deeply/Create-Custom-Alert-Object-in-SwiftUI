//
//  MainView.swift
//  Crate Custom Alert Object in SwiftUI
//
//  Created by Can Balkaya on 3/7/21.
//

import SwiftUI

struct MainView: View {
    
    // MARK: - Properties
    @ObservedObject var dataStore = DataStore.shared
    @State var completedTasksViewIsAppear = false
    
    // MARK: - UI Elements
    var body: some View {
        NavigationView {
            List {
                if !dataStore.completedTodoItems.isEmpty {
                    CompletedTasksSectionView(count: dataStore.completedTodoItems.count)
                        .onTapGesture {
                            completedTasksViewIsAppear = true
                        }
                }
                
                Section {
                    ForEach(dataStore.incompleteTodoItems) { todoItem in
                        ListCellView(todoItem: todoItem, alertShowing: $dataStore.alertShowing)
                    }
                }
            }
            .listStyle(InsetGroupedListStyle())
            .navigationBarItems(trailing: Button(action: {
                dataStore.currentAction = Action.actions.create
                dataStore.alertShowing = true
            }) {
                Image(systemName: "plus.circle.fill")
                    .font(.title3)
            })
            .navigationTitle("Waiting Tasks")
        }
        .textFieldAlert(isPresented: $dataStore.alertShowing) {
            TextFieldAlert(action: dataStore.currentAction!)
        }
        .sheet(isPresented: $completedTasksViewIsAppear, content: {
            CompletedTasksView()
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
