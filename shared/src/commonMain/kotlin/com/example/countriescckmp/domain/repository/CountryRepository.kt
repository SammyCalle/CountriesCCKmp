package com.example.countriescckmp.domain.repository

import com.example.countriescckmp.domain.model.CountryDetail
import com.example.countriescckmp.domain.model.CountrySummary
import kotlinx.coroutines.flow.Flow

interface CountryRepository {

    fun searchCountries(query: String): Flow<List<CountrySummary>>

    suspend fun syncIfNeeded()

    suspend fun getCountryByCode(code: String) : CountryDetail
}