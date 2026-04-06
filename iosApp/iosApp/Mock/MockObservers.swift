//
//  MockObservers.swift
//  iosApp
//
//  Created by Sammy Calle Torres on 06.04.2026.
//

import SwiftUI
import Shared

// Mock DetailObserver
class MockDetailObserver: ObservableObject {
    @Published var uiState: DetailScreenUiState = .Success(country: mockCountryDetail)
    
    init(countryCode: String) {}
}

// Mock SearchObserver
class MockSearchObserver: ObservableObject {
    @Published var uiState: SearchScreenUiState = .Success(countries: mockCountries)
    
    var query: String = ""
    func onQueryChange(query: String) {
        self.query = query
    }
}
