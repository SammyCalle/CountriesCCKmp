//
//  SearchView.swift
//  iosApp
//
//  Created by Sammy Calle Torres on 06.04.2026.
//

struct SearchView: View {
    @Binding var  path : NavigationPath
    @StateObject private var observer = SearchObserver()
    
    var body: some View {
            VStack {
                SearchBar(
                    query: observer.query,
                    onQueryChange: { observer.onQueryChange(query: $0) }
                )

                Group {
                    if observer.uiState is SearchScreenUiState.Loading {
                        ProgressView()
                            .frame(maxWidth: .infinity, maxHeight: .infinity)

                    } else if let success = observer.uiState as? SearchScreenUiState.Success {
                        if success.countries.isEmpty {
                            Text("No countries found")
                                .foregroundColor(.secondary)
                        } else {
                            List(success.countries, id: \.countryCode) { country in
                                CountryRowView(country: country)
                                    .onTapGesture {
                                        path.append(AppRoute.detail(countryCode: country.countryCode))
                                    }
                            }
                            .listStyle(.plain)
                        }

                    } else if let error = observer.uiState as? SearchScreenUiState.Error {
                        Text(error.message)
                            .foregroundColor(.red)
                    }
                }
            }
            .navigationTitle("Countries")
            .navigationBarTitleDisplayMode(.large)
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
