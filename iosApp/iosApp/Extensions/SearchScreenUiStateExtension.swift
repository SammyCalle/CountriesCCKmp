//
//  SearchScreenUiStateExtension.swift
//  iosApp
//
//  Created by Sammy Calle Torres on 06.04.2026.
//

import Shared

enum SearchUiStateSwift {
    case loading
    case success(countries: [CountrySummary])
    case error(message: String)
}

extension SearchScreenUiState {
    var asSwift: SearchUiStateSwift {
        if let success = self as? SearchScreenUiState.Success {
            return .success(countries: success.countries)
        } else if let error = self as? SearchScreenUiState.Error {
            return .error(message: error.message)
        } else {
            return .loading
        }
    }
}
