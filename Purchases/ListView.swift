//
//  ListView.swift
//  Purchases
//
//  Created by Abdul Ahad Khan on 2020-11-04.
//

import SwiftUI

struct ListView: View {
    
    @Binding var items: [PurchasedItem]
    
    var body: some View {
        Form {
            Section(header: Text("LIST OF PURCHASES")) {
                List(items) { item in
                    Text("\(item.purchasePrice)")
                }
            }
        }
    }
}
//
//struct ListView_Previews: PreviewProvider {
//    static var previews: some View {
//        ListView()
//    }
//}
