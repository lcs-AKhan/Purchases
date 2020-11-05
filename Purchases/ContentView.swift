//
//  ContentView.swift
//  Purchases
//
//  Created by Abdul Ahad Khan on 2020-11-04.
//

import SwiftUI

struct PurchasedItem: Identifiable {
    var id = UUID()
    let purchasePrice: Double
    let name: String
}

struct ContentView: View {
    
    @State private var purchaseAmount = ""
    @State private var totalSpent: Double = 0
    @State private var name = ""
        
    @State private var items = [PurchasedItem]()
    
    
    var body: some View {
        
        NavigationView() {
            Form {
                Section(header: Text("Add a purchase")) {
                    TextField("Purchase cost", text: $purchaseAmount)
                                .keyboardType(.decimalPad)
                    TextField("Purchase name", text: $name)
                    Button(action: {
                        addToTotal()
                        addToList()
                    }) {
                        Text("Add Purchase")
                    }
                }
                Section {
                    NavigationLink("Purchase List", destination: ListView(items: $items))
                }
                Section(header: Text("Total Spent")) {
                    Text("$\(totalSpent, specifier: "%.2f")")
                }
            }
            .navigationBarTitle("Purchases")
        }
    }
    func addToTotal() {
        let purchaseAmountInt = Double(purchaseAmount) ?? 0
        totalSpent += purchaseAmountInt
    }
    func addToList() {
        items.append(PurchasedItem(purchasePrice: Double(purchaseAmount) ?? 0, name: name))
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
