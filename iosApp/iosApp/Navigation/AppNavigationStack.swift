//
// Created by Sammy Calle Torres on 06.04.2026.
//

import SwiftUI
import Shared

struct AppNavigationStack: View {
    @State private var path = NavigationPath()

    var body: some View {
        NavigationStack(path: $path) {
            SearchView(path: $path)
                .navigationDestination(for: AppRoute.self) { route in
                    switch route {
                    case .search:
                        SearchView(path: $path)
                    case .detail(let countryCode):
                        DetailView(countryCode: countryCode)
                    }
                }
        }
    }
}