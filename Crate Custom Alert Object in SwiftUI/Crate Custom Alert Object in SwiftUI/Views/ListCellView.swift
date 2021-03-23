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
    
    // MARK: - View
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 5) {
                VStack(alignment: .leading, spacing: 2) {
                    Text(todoItem.title)
                        .font(.title2)
                    
                    if !todoItem.description!.isEmpty {
                        Text(todoItem.description!)
                            .font(.callout)
                    }
                }
                
                if let date = todoItem.date {
                    Text(Date().dateString(date: date))
                        .font(.caption)
                        .foregroundColor(.gray)
                }
            }
            
            Spacer()
            
            if let priorityColor = todoItem.priority?.rawValue.color {
                Image(systemName: "flag.fill")
                    .foregroundColor(Color(priorityColor))
            }
        }
        .padding(.vertical)
        .contextMenu(menuItems: {
            dataStore.getMenuItems(selected: todoItem)
        })
    }
}

struct ListCellView_Previews: PreviewProvider {
    static var previews: some View {
        ListCellView(todoItem: TodoItem.example[0], alertShowing: .constant(false))
            .previewLayout(PreviewLayout.sizeThatFits)
    }
}
