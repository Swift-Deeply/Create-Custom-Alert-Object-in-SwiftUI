//
//  MainView.swift
//  Crate Custom Alert Object in SwiftUI
//
//  Created by Can Balkaya on 3/7/21.
//

import SwiftUI

struct MainView: View {
    
    // MARK: - Properties
    @State private var alertShowing = false
    
    // MARK: - UI Elements
    var body: some View {
        NavigationView {
            Button(action: {
                alertShowing = true
            }) {
                Text("Click here!")
            }
            .navigationTitle("To-Do List")
        }
        .textFieldAlert(isPresented: $alertShowing) {
            TextFieldAlert(title: "wpefk", message: "wpefk")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
