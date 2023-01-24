//
//  SandwichesApp.swift
//  Sandwiches
//
//  Created by Nazar Ivzhenko on 23.01.2023.
//

import SwiftUI

@main
struct SandwichesApp: App {
    @StateObject private var store = SandwichStore()
    
    var body: some Scene {
        WindowGroup {
            ContentView(store: store)
        }
    }
}
