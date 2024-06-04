//
//  APIManager.swift
//  BreweryAPI
//
//  Created by Matta, Ralph (PEPW) on 04/06/2024.
//

import Foundation

class APIManager: ObservableObject {
    
    static let shared = APIManager()
    
    private init() {}
    
    private let baseURL: String = "https://api.openbrewerydb.org/v1/breweries"
    
    func searchFor(query: String, completion: @escaping ([AutocompleteResult]) -> Void) {
        let query = "/autocomplete?query=\(query)"
        
        guard let url = URL(string: baseURL + query) else {
            print("Invalid URL")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }
            let decoder = JSONDecoder()
            
            guard let data = data,
                  let results = try? decoder.decode([AutocompleteResult].self, from: data) else {
                print("Error decoding")
                return
            }
            
            completion(results)
        }
        task.resume()
    }
    
    func getBreweryDetails(id: String, completion: @escaping (SingleBrewery) -> Void) {
        let query = "/{\(id)}"
        
        guard let url = URL(string: baseURL + query) else {
            print("Invalid URL")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }
            let decoder = JSONDecoder()
            
            guard let data = data,
                  let result = try? decoder.decode(SingleBrewery.self, from: data) else {
                print("Error decoding")
                return
            }
            
            completion(result)
        }
        task.resume()
    }
}
