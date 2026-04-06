package com.example.countriescckmp.domain.usecase

import com.example.countriescckmp.domain.repository.CountryRepository

class SyncCountriesUseCase(
    private val repository: CountryRepository
) {
    suspend operator fun invoke() = repository.syncIfNeeded()
}