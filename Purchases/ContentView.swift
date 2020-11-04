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
    
    @State var purchaseList = [String]()
    @State var item = 0
    
    var body: some View {
        
        NavigationView() {
            Form {
                Section {
                    TextField("Purchase cost", text: $purchaseAmount)
                                .keyboardType(.decimalPad)
                    Button(action: {
                        AddToTotal()
                        purchaseList.append(purchaseAmount)
                    }) {
                        Text("Add Purchase")
                    }
                }
                Section{
                    NavigationLink("Purchase List", destination: ListView())
                }
                Text("$\(totalSpent, specifier: "%.2f")")
            }
            .navigationBarTitle("Purchases")
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
