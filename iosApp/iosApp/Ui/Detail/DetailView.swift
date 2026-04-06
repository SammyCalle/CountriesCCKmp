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
            switch observer.uiState.asSwift {
            case .loading:
                ProgressView()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            case .success(let country):
                DetailContentView(country: country)
            case .error(let message):
                Text(message)
                    .foregroundColor(.red)
            }
        }
        .navigationTitle(countryCode)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct DetailContentView: View {
    let country: CountryDetail

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {

                // Flag image
                AsyncImage(url: URL(string: country.flag)) { image in
                    image
                        .resizable()
                        .scaledToFill()
                } placeholder: {
                    Color.gray
                }
                .frame(height: 220)
                .frame(maxWidth: .infinity)
                .clipped()

                // Country name
                Text(country.name)
                    .font(.title)
                    .bold()
                    .padding(.horizontal, 16)

                // Coat of arms
                AsyncImage(url: URL(string: country.coatOfArms)) { image in
                    image
                        .resizable()
                        .scaledToFit()
                } placeholder: {
                    Color.gray
                }
                .frame(width: 80, height: 80)
                .padding(.horizontal, 16)

                // Sections
                DetailSection(title: "Capital", value: country.capital.joined(separator: ", "))
                DetailSection(title: "Population", value: "\(country.population.formatted())")
                DetailSection(title: "Continent", value: country.continents.joined(separator: ", "))
                DetailSection(title: "Currency", value: country.currencyName.joined(separator: ", "))
                DetailSection(title: "Languages", value: country.languages.joined(separator: ", "))
                DetailSection(title: "Timezones", value: country.timezones.joined(separator: ", "))

                // Google Maps link
                Link("View on Google Maps", destination: URL(string: country.googleMaps)!)
                    .padding(.horizontal, 16)
                    .foregroundColor(.black)
                    .underline()

                Spacer(minLength: 24)
            }
        }
        .navigationBarBackButtonHidden(true) // since you have custom back button
    }
}

struct DetailSection: View {
    let title: String
    let value: String

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(title)
                .foregroundColor(.secondary)
                .font(.subheadline)

            Text(value)
                .bold()
        }
        .padding(.horizontal, 16)
    }
}
