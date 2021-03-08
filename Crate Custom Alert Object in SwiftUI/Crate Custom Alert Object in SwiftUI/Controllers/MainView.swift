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
//                        .onTapGesture {
//                            alertShowing = true
//                        }
                        .contextMenu(ContextMenu(menuItems: { menuItems }))
                }
//                .onDelete(perform: dataStore.delete)
            }
            .listStyle(InsetGroupedListStyle())
            .navigationBarItems(trailing: Button(action: {
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
        ForEach(dataStore.actionTypes, id: \.self) { actionType in
            Button(action: {
                dataStore.actionType = actionType
                alertShowing = true
            }) {
                Text(actionType.rawValue)
            }
        }
    }
    
    var deleteButton: some View {
        Button(action: {
            dataStore.actionType = .delete
            alertShowing = true
        }) {
            Text("Delete Item")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
