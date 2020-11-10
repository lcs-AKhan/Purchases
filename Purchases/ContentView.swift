//
//  ContentView.swift
//  Purchases
//
//  Created by Abdul Ahad Khan on 2020-11-04.
//

import SwiftUI

// STRUCT FOR EACH PURCHASED ITEM

struct PurchasedItem: Identifiable {
    var id = UUID()
    let purchasePrice: Double
    let name: String
}

struct ContentView: View {
    
    // VARIABLES
    
    @State private var purchaseAmount = ""
    @State private var totalSpent: Double = 0
    @State private var name = ""
    
    @State private var budget = ""
    @State private var budgetExceeds = false
    @State private var budgetAmountText = ""
        
    @State private var items = [PurchasedItem]()
    
    @State private var resetAlertShowing = false
    
    var body: some View {
        
        NavigationView() {
            Form {
                Section(header: Text("Budget")) {
                    TextField("Budget", text: $budget)
                    // Set A Budget Button
                    Button(action: {
                        budgetAmountText = budget
                    }) {
                        Text("Set Budget")
                    }
                }
                Section(header: Text("Add a purchase")) {
                    TextField("Purchase cost", text: $purchaseAmount)
                                .keyboardType(.decimalPad)
                    TextField("Purchase name", text: $name)
                    // Add a Purchase Button
                    Button(action: {
                        AddToTotal()
                        AddToList()
                        CheckBudget()
                    }) {
                        Text("Add Purchase")
                    }
                }
                Section {
                    NavigationLink("Purchase List", destination: ListView(items: items))
                }
                // Display of Total Spent and Budget
                Section(header: Text("Total Spent")) {
                    Text("$\(totalSpent, specifier: "%.2f")")
                    Text("Budget: $\(budgetAmountText)")
                }
                Section {
                    // Reset Purchases Button
                    Button(action: {
                        self.resetAlertShowing = true
                    }) {
                        Text("Reset Purchases")
                            .foregroundColor(.red)
                    }
                    .alert(isPresented: $resetAlertShowing) {
                        Alert(title: Text("Reset Purchases?") , primaryButton: .default(Text("Continue")), secondaryButton: .cancel())
                    }
                }
            }
            // ALERTS
            .alert(isPresented: $budgetExceeds) {
                Alert(title: Text("Warning"), message: Text("You have exceeded your budget!"), dismissButton: .default(Text("Okay")) {
                })
            }
            .navigationBarTitle("Purchases")
        }
    }
    // FUNCTIONS
    func AddToTotal() {
        let purchaseAmountInt = Double(purchaseAmount) ?? 0
        totalSpent += purchaseAmountInt
    }
    func AddToList() {
        items.append(PurchasedItem(purchasePrice: Double(purchaseAmount) ?? 0, name: name))
    }
    func CheckBudget() {
        let budgetAmount = Double(budgetAmountText) ?? 10000000000000000
        if totalSpent > budgetAmount {
            budgetExceeds = true
        } else {
            budgetExceeds = false
        }
    }
    func ResetPurchases() {
        totalSpent = 0
        items = [PurchasedItem]()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
