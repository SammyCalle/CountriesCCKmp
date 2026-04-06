//
//  SearchView.swift
//  iosApp
//
//  Created by Sammy Calle Torres on 06.04.2026.
//

import SwiftUI
import Shared

struct SearchView: View {
    @Binding var path: NavigationPath
    @StateObject private var observer = SearchObserver()

    var body: some View {
        VStack {
            SearchBar(
                query: observer.query,
                onQueryChange: { observer.onQueryChange(query: $0) }
            )
            stateView
        }
        .navigationTitle("Countries")
        .navigationBarTitleDisplayMode(.large)
    }

    @ViewBuilder
    private var stateView: some View {
        switch observer.uiState.asSwift {
        case .loading:
            ProgressView()
                .frame(maxWidth: .infinity, maxHeight: .infinity)

        case .success(let countries):
            if countries.isEmpty {
                Text("No countries found")
                    .foregroundColor(.secondary)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            } else {
                List {
                    ForEach(countries, id: \.code) { country in
                        CountryRowView(country: country)
                            .onTapGesture {
                                path.append(AppRoute.detail(countryCode: country.code))
                            }
                    }
                }
                .listStyle(.plain)
            }

        case .error(let message):
            Text(message)
                .foregroundColor(.red)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}


struct SearchBar: View {
    let query : String
    let onQueryChange: (String) -> Void
    
    var body: some View{
        HStack {
            Image(systemName : "magnifyingglass")
                .foregroundColor(.secondary)
            TextField("Search countries...", text: Binding(
                            get: { query },
                            set: { onQueryChange($0) }
                        ))
        }
        .padding(10)
        .background(Color(.systemGray6))
        .cornerRadius(10)
        .padding(.horizontal)
        
    }
}

struct CountryRowView: View {
    let country: CountrySummary

    var body: some View {
        HStack {
            Text(country.name)
                .font(.body)
            Spacer()
            Image(systemName: "chevron.right")
                .foregroundColor(.secondary)
                .font(.caption)
        }
        .padding(.vertical, 4)
    }
}
