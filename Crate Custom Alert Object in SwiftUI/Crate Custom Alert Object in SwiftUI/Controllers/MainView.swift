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
    
    // MARK: - UI Elements
    var body: some View {
        NavigationView {
            List {
                ForEach(dataStore.todoItems) { todoItem in
                    ListCellView(todoItem: todoItem)
                        .contextMenu(ContextMenu(menuItems: { menuItems }))
                }
            }
            .listStyle(InsetGroupedListStyle())
            .navigationBarItems(trailing: Button(action: {
                dataStore.actionType = .create
                alertShowing = true
            }) {
                Image(systemName: "plus.circle.fill")
            })
            .navigationTitle("To-Do List")
        }
        .textFieldAlert(isPresented: $alertShowing) {
            TextFieldAlert(actionType: dataStore.actionType)
        }
    }
    
    var menuItems: some View {
        ForEach(dataStore.menuActionTypes, id: \.self) { actionType in
            Button(action: {
                dataStore.actionType = actionType
                alertShowing = true
            }) {
                Text(actionType.rawValue.0)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
