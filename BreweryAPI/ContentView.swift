//
//  ContentView.swift
//  BreweryAPI
//
//  Created by Matta, Ralph (PEPW) on 04/06/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var search: String = ""
    @State private var results: [ApiResult] = []
    
    @ObservedObject var apiManager = ApiManager.shared
    
    var body: some View {
        
        NavigationStack {
            TextField("Enter search item", text: $search)
                .onChange(of: search) { oldValue, newValue in
                    print("New value is: \(newValue)")
                    apiManager.searchFor(query: newValue) { results in
                        self.results = results
                    }
                }
            
            Text("API Results:")
            
            List {
                ForEach(results, id:\.id) { result in
                    NavigationLink("\(result.name)") {
                        BreweryDetailView(breweryId: result.id)
                    }
                }
            }
            .navigationTitle("Brewery API")
        }
    }
}

#Preview {
    ContentView()
}
