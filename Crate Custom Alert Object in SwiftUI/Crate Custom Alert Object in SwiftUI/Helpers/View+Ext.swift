//
//  View+Ext.swift
//  Crate Custom Alert Object in SwiftUI
//
//  Created by Can Balkaya on 3/7/21.
//

import SwiftUI

extension View {
    
    // MARK: - Methods
    func textFieldAlert(isPresented: Binding<Bool>, content: @escaping () -> TextFieldAlert) -> some View {
        TextFieldWrapper(isPresented: isPresented, presentingView: self, content: content)
    }
}
