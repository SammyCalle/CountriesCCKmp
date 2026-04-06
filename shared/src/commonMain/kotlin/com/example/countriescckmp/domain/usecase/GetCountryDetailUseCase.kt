package com.example.countriescckmp.domain.usecase

import com.example.countriescckmp.domain.repository.CountryRepository

class GetCountryDetailUseCase (
    private val repository: CountryRepository
) {
    suspend operator fun invoke(countryCode: String) =
        repository.getCountryByCode(countryCode)

}