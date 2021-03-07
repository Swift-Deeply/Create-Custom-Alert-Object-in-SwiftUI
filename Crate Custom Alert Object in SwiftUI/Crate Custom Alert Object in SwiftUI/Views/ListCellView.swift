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
    
    // MARK: - UI Elements
    var body: some View {
        VStack {
            Text(todoItem.title)
            Text(todoItem.description!)
            Image(systemName: "flag.fill")
                .foregroundColor(Color(todoItem.priority.rawValue))
        }
    }
}

struct ListCellView_Previews: PreviewProvider {
    static var previews: some View {
        ListCellView(todoItem: TodoItem.example[0])
    }
}
