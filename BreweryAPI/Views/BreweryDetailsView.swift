//
//  BreweryDetailsView.swift
//  BreweryAPI
//
//  Created by Matta, Ralph (PEPW) on 04/06/2024.
//

import SwiftUI

struct BreweryDetailsView: View {
    
    @State var breweryId: String
    @State var brewery: SingleBrewery?
    
    @ObservedObject var apiManager: APIManager
    
    var body: some View {
        VStack {
            if let brewery = brewery {
                Text("Id: \(breweryId)")
                Text("Name: \(brewery.name)")
                Text("Type: \(brewery.brewery_type)")
                Text("Address: \(brewery.address_1 + ", " + brewery.city + ", " + brewery.state_province + ", " + brewery.postal_code + ", ", brewery.country + ", " + brewery.state + ", " + brewery.street)")
            } else {
                Text("No brewery found yet")
            }
        }
        .onAppear {
            apiManager.getBreweryDetails(id: breweryId) {_ in 
                self.brewery = brewery
            }
        }
    }
}

#Preview {
    BreweryDetailsView(breweryId: "b54b16e1-ac3b-4bff-a11f-f7ae9ddc27e0", apiManager: APIManager())
}
