//
//  DetailObserver.swift
//  iosApp
//
//  Created by Sammy Calle Torres on 06.04.2026.
//

import SwiftUI
import Combine
import shared

@MainActor
class DetailObserver: ObservableObject {
    private let helper = DetailViewModelHelper()
    @Published var uiState: DetailScreenUiState
    private var job: Kotlinx_coroutines_coreJob?

    init(countryCode: String) {
        self.uiState = helper.viewModel.uiState.value
        job = helper.observeUiState { [weak self] state in
            self?.uiState = state
        }
        helper.viewModel.loadCountry(countryCode: countryCode)
    }

    deinit {
        job?.cancel(cause: nil)
    }
}
