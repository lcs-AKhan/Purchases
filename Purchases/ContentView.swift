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
    
    @State private var budget = ""
    @State private var budgetExceeds: Bool = false
    
    @State private var items = [PurchasedItem]()
    
    
    var body: some View {
        
        NavigationView() {
            Form {
                Section(header: Text("Add a purchase")) {
                    TextField("Purchase cost", text: $purchaseAmount)
                                .keyboardType(.decimalPad)
                    TextField("Purchase name", text: $name)
                    Button(action: {
                        AddToTotal()
                        AddToList()
                        CheckBudget()
                    }) {
                        Text("Add Purchase")
                    }
                }
                Section {
                    TextField("Budget", text: $budget)
                }
                Section {
                    NavigationLink("Purchase List", destination: ListView(items: items))
                }
                Section(header: Text("Total Spent")) {
                    Text("$\(totalSpent, specifier: "%.2f")")
                }
            }
            .alert(isPresented: $budgetExceeds) {
                Alert(title: Text("Warning"), message: Text("You have exceeded your budget!"), dismissButton: .default(Text("Okay")))
            }
            .navigationBarTitle("Purchases")
        }
    }
    func AddToTotal() {
        let purchaseAmountInt = Double(purchaseAmount) ?? 0
        totalSpent += purchaseAmountInt
    }
    func AddToList() {
        items.append(PurchasedItem(purchasePrice: Double(purchaseAmount) ?? 0, name: name))
    }
    func CheckBudget() {
        let budgetAmount = Double(budget) ?? 100
        if budgetAmount > totalSpent {
            budgetExceeds = true
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
