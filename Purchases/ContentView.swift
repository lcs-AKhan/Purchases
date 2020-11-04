//
//  ContentView.swift
//  Purchases
//
//  Created by Abdul Ahad Khan on 2020-11-04.
//

import SwiftUI

struct ContentView: View {
    
    @State private var purchaseAmount = ""
    @State private var totalSpent: Double = 0
    
    func AddToTotal() {
        let purchaseAmountInt = Double(purchaseAmount) ?? 0
        totalSpent += purchaseAmountInt

    }
    
    var body: some View {
        
        Form {
            Section {
                TextField("Purchase cost", text: $purchaseAmount)
                            .keyboardType(.decimalPad)
                Button(action: {
                    AddToTotal()
                }) {
                    Text("Add Purchase")
                }
            }
            Text("$\(totalSpent, specifier: "%.2f")")
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
