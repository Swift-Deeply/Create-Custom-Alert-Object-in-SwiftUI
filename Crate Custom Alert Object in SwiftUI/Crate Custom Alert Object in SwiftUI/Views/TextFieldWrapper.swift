//
//  TextFieldWrapper.swift
//  Crate Custom Alert Object in SwiftUI
//
//  Created by Can Balkaya on 3/7/21.
//

import SwiftUI

struct TextFieldWrapper<PresentingView: View>: View {

    // MARK: - Properties
    @Binding var isPresented: Bool
    let presentingView: PresentingView
    let content: () -> TextFieldAlert

    // MARK: - UI Elements
    var body: some View {
        ZStack {
            if (isPresented) { content().dismissable($isPresented) }
            presentingView
        }
    }
}
