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
    @State private var alertShowing = false
    @State var completedTasksViewIsAppear = false
    
    // MARK: - UI Elements
    var body: some View {
        NavigationView {
            List {
                Section {
                    HStack {
                        Spacer()
                        Text("You have completed \(10) tasks. 🎉")
                        Spacer()
                    }
                }
                .onTapGesture {
                    completedTasksViewIsAppear = true
                }
                
                Section {
                    ForEach(dataStore.incompleteTodoItems) { todoItem in
                        ListCellView(todoItem: todoItem, alertShowing: $alertShowing)
                    }
                }
            }
            .listStyle(InsetGroupedListStyle())
            .navigationBarItems(trailing: Button(action: {
                dataStore.alertShowing = true
                dataStore.currentAction = Action.actions.create
            }) {
                Image(systemName: "plus.circle.fill")
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
