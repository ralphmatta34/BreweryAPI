//
//  ContentView.swift
//  BreweryAPI
//
//  Created by Matta, Ralph (PEPW) on 04/06/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var search: String = String()
    @State private var results: [AutocompleteResult] = []
    @ObservedObject var apiManager = APIManager.shared
    
    var body: some View {
        NavigationStack {
            TextField("Enter a search item", text: $search)
                .onChange(of: search) { oldValue, newValue in
                    print("New value is \(newValue)")
                    apiManager.searchFor(query: newValue) { results in
                        self.results = results
                    }
                }
            Text("API Results: ")
            
            List {
                ForEach(results, id:\.id) { result in
                    NavigationLink(result.name) {
                        BreweryDetailsView(breweryId: self.id result.getAllProperties(id: result.id, completion: {
                                return
                        }))
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
