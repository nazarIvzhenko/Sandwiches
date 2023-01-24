//
//  ContentView.swift
//  Sandwiches
//
//  Created by Nazar Ivzhenko on 23.01.2023.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var store: SandwichStore
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(store.sandwiches) { sandwich in
                    SandwichCell(sandwich: sandwich)
                }
                .onMove(perform: moveSandwiches)
                .onDelete(perform: deleteSandwiches)
                
                HStack {
                    Spacer()
                    Text("\(store.sandwiches.count) sandwiches")
                        .foregroundColor(.secondary)
                    Spacer()
                }
                .alignmentGuide(.listRowSeparatorLeading) { viewDimensions in
                    return 0
                }
            }
            .listStyle(.plain)
            .navigationTitle("Sandwiches")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Add", action: makeSandwich)
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()                    
                }
            }
        }
    }
    
    func makeSandwich() {
        withAnimation {
            store.sandwiches.append(Sandwich(name: "Patty Melt", ingredientCount: 3))
        }
    }
    
    func moveSandwiches(from: IndexSet, to: Int) {
        withAnimation {
            store.sandwiches.move(fromOffsets: from, toOffset: to)
        }
    }
    
    func deleteSandwiches(offsets: IndexSet) {
        withAnimation {
            store.sandwiches.remove(atOffsets: offsets)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(store: testStore)
    }
}

struct SandwichCell: View {
    var sandwich: Sandwich
    
    var body: some View {
        NavigationLink(destination: SandwichDetail(sandwich: sandwich)) {
            HStack {
                Image(sandwich.thumbnailName)
                    .cornerRadius(8)
                
                VStack(alignment: .leading) {
                    Text(sandwich.name)
                    Text("\(sandwich.ingredientCount) ingredients")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
            }
        }
    }
}
