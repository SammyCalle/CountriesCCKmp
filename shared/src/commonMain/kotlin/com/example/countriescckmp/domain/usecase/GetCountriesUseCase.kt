package com.example.countriescckmp.domain.usecase

import com.example.countriescckmp.domain.model.CountrySummary
import com.example.countriescckmp.domain.repository.CountryRepository
import kotlinx.coroutines.flow.Flow

class GetCountriesUseCase(
    private val repository: CountryRepository
) {
    operator fun invoke(query : String) : Flow<List<CountrySummary>> =
        repository.searchCountries(query)
}