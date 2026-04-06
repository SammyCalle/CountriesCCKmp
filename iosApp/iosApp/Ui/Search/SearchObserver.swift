//
// Created by Sammy Calle Torres on 06.04.2026.
//

import Combine
import SwiftUI
import shared

@MainActor
class SearchObserver : ObservableObject{
    private let helper = SearchViewModelHelper()
    @Published var uiState : DetailScreenUiState = DetailScreenUiState.Loading()

    init(countryCode: String) {
        helper.viewModel.loadCountry(countryCode: countryCode)
        Task {
            for await state in helper.viewModel.uiState {
                self.uiState = state
            }
        }
    }
}
