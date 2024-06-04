//
//  SingleBrewery.swift
//  BreweryAPI
//
//  Created by Matta, Ralph (PEPW) on 04/06/2024.
//

import Foundation

struct SingleBrewery: Codable {
    let id: String
    let name: String
    let brewery_type: String
    let address_1: String
    let city: String
    let state_province: String
    let postal_code: String
    let country: String
    let longitude: String
    let latitude: String
    let phone: String
    let website_url: String
    let state: String
    let street: String
}
