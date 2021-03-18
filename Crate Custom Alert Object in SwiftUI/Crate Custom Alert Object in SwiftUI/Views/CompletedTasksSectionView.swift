//
//  CompletedTasksSectionView.swift
//  Crate Custom Alert Object in SwiftUI
//
//  Created by Can Balkaya on 3/19/21.
//

import SwiftUI

struct CompletedTasksSectionView: View {
    
    // MARK: - Properties
    let count: Int
    
    // MARK: - UI Elements
    var body: some View {
        Section {
            HStack {
                Spacer()
                
                Text("You have completed \(count) tasks. 🎉")
                    .multilineTextAlignment(.center)
                
                Spacer()
            }
        }
    }
}

struct CompletedTasksSectionView_Previews: PreviewProvider {
    static var previews: some View {
        CompletedTasksSectionView(count: 10)
    }
}
