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
        HStack {
            VStack(alignment: .leading) {
                Text(todoItem.title)
                    .font(.title2)
                
                Text(todoItem.description!)
                    .font(.callout)
                
                Text(Date().dateString(date: todoItem.date))
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            
            Spacer()
            
            Image(systemName: "flag.fill")
                .foregroundColor(Color(todoItem.priority.rawValue))
        }
        .padding(.vertical)
    }
}

struct ListCellView_Previews: PreviewProvider {
    static var previews: some View {
        ListCellView(todoItem: TodoItem.example[0])
            .previewLayout(PreviewLayout.sizeThatFits)
    }
}
