//
//  DetailView.swift
//  iosApp
//
//  Created by Sammy Calle Torres on 06.04.2026.
//

import SwiftUI
import Shared

struct DetailView: View {
    let countryCode: String
    @StateObject private var observer: DetailObserver

    init(countryCode: String) {
        self.countryCode = countryCode
        _observer = StateObject(wrappedValue: DetailObserver(countryCode: countryCode))
    }

    var body: some View {
        Group {
            if observer.uiState is DetailScreenUiState.Loading {
                ProgressView()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)

            } else if let success = observer.uiState as? DetailScreenUiState.Success {
                DetailContentView(detail: success.detail)

            } else if let error = observer.uiState as? DetailScreenUiState.Error {
                Text(error.message)
                    .foregroundColor(.red)
            }
        }
        .navigationTitle(countryCode)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct DetailContentView: View {
    let detail: CountryDetail   // your domain model

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text(detail.name)
                    .font(.largeTitle)
                    .bold()
                DetailRow(label: "Capital", value: detail.capital)
                DetailRow(label: "Region", value: detail.region)
                DetailRow(label: "Code", value: detail.countryCode)
            }
            .padding()
        }
    }
}

struct DetailRow: View {
    let label: String
    let value: String

    var body: some View {
        HStack {
            Text(label)
                .foregroundColor(.secondary)
                .frame(width: 80, alignment: .leading)
            Text(value)
                .bold()
        }
    }
}
