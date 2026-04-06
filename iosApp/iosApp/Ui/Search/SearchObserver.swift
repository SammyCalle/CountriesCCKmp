//
// Created by Sammy Calle Torres on 06.04.2026.
//

import Combine
import SwiftUI
import Shared

@MainActor
class SearchObserver : ObservableObject{
    private let helper = SearchViewModelHelper()
        @Published var uiState: SearchScreenUiState
        @Published var query: String = ""          // ← was missing
        private var job: Kotlinx_coroutines_coreJob?
        private var queryJob: Kotlinx_coroutines_coreJob?   // ← was missing

        init() {
            self.uiState = helper.viewModel.uiState.value as! SearchScreenUiState

            job = helper.observeUiState { [weak self] (state: Any?) in
                self?.uiState = state as! SearchScreenUiState
            }

            queryJob = helper.observeQuery { [weak self] (q: Any?) in  // ← was missing
                self?.query = q as! String
            }
        }

        func onQueryChange(query: String) {
            helper.viewModel.onQueryChange(newQuery: query)
        }

        deinit {
            job?.cancel(cause: nil)
            queryJob?.cancel(cause: nil)
        }
}
