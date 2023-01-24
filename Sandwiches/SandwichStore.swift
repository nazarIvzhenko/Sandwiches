//
//  SandwichStore.swift
//  Sandwiches
//
//  Created by Nazar Ivzhenko on 23.01.2023.
//

import Foundation

class SandwichStore: ObservableObject {
    @Published var sandwiches: [Sandwich]
    
    init(sandwiches: [Sandwich] = []) {
        self.sandwiches = sandwiches
    }
}

let testStore = SandwichStore(sandwiches: testData)
