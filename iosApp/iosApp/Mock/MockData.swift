//
//  MockData.swift
//  iosApp
//
//  Created by Sammy Calle Torres on 06.04.2026.
//

import Foundation
import Shared

// Mock CountryDetail for DetailView
let mockCountryDetail = CountryDetail(
    name: "Germany",
    capital: "Berlin",
    region: "Europe",
    countryCode: "DE"
)

// Mock CountrySummary for SearchView
let mockCountries: [CountrySummary] = [
    CountrySummary(name: "Germany", countryCode: "DE"),
    CountrySummary(name: "France", countryCode: "FR"),
    CountrySummary(name: "Japan", countryCode: "JP")
]
