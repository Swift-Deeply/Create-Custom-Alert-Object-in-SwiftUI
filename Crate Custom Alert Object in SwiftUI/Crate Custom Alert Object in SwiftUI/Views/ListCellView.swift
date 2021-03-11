//
//  ListCellView.swift
//  Crate Custom Alert Object in SwiftUI
//
//  Created by Can Balkaya on 3/7/21.
//

import SwiftUI

struct ListCellView: View {
    
    // MARK: - Properties
    let todoItem: TodoItem
    let dataStore = DataStore.shared
    @Binding var alertShowing: Bool
    
    // MARK: - UI Elements
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 5) {
                VStack(alignment: .leading, spacing: 2) {
                    Text(todoItem.title)
                        .font(.title2)
                    
                    Text(todoItem.description!)
                        .font(.callout)
                }
                
                Text(Date().dateString(date: todoItem.date))
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            
            Spacer()
            
            Image(systemName: "flag.fill")
                .foregroundColor(Color(todoItem.priority.rawValue))
        }
        .padding(.vertical)
        .contextMenu(ContextMenu(menuItems: { menuItems }))
    }
    
    var menuItems: some View {
        ForEach(dataStore.menuActions) { action in
            Button(action: {
                dataStore.currentAction = action
                alertShowing = true
            }) {
                Text("action.menuTitle!")
            }
        }
    }
}

struct ListCellView_Previews: PreviewProvider {
    static var previews: some View {
        ListCellView(todoItem: TodoItem.example[0], alertShowing: .constant(false))
            .previewLayout(PreviewLayout.sizeThatFits)
    }
}
