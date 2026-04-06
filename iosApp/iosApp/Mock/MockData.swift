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
    coatOfArms: "https://upload.wikimedia.org/wikipedia/commons/d/da/Coat_of_arms_of_Germany.svg",
    flag: "https://upload.wikimedia.org/wikipedia/en/b/ba/Flag_of_Germany.svg",
    flagDescription: "The flag of Germany consists of three horizontal bands of black, red, and gold.",
    currencyName: ["Euro"],
    capital: ["Berlin"],
    population: 83200000,
    languages: ["German"],
    continents: ["Europe"],
    timezones: ["UTC+01:00", "UTC+02:00"],
    googleMaps: "https://goo.gl/maps/mD9FBMq1nvXUBrkv6"
)

// Mock CountrySummary for SearchView
let mockCountries: [CountrySummary] = [
    CountrySummary(name: "Germany", code: "DE"),
    CountrySummary(name: "France", code: "FR"),
    CountrySummary(name: "Japan", code: "JP")
]
