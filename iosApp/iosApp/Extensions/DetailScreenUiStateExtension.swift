//
//  DetailScreenUiStateExtension.swift
//  iosApp
//
//  Created by Sammy Calle Torres on 06.04.2026.
//

import Shared

enum DetailUiStateSwift {
    case loading
    case success(country: CountryDetail)
    case error(message: String)
}

extension DetailScreenUiState {
    var asSwift: DetailUiStateSwift {
        if let success = self as? DetailScreenUiState.Success {
            return .success(country: success.country)
        } else if let error = self as? DetailScreenUiState.Error {
            return .error(message: error.message)
        } else {
            return .loading
        }
    }
}
