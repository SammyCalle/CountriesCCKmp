package com.example.countriescckmp.data.repository

import com.example.countriescckmp.data.local.CountryLocalDataSource
import com.example.countriescckmp.data.mapper.toDomain
import com.example.countriescckmp.data.mapper.toEntity
import com.example.countriescckmp.data.remote.api.CountryRemoteDataSource
import com.example.countriescckmp.domain.model.CountryDetail
import com.example.countriescckmp.domain.model.CountrySummary
import com.example.countriescckmp.domain.repository.CountryRepository
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.map

class CountryRepositoryImpl(
    private val remote : CountryRemoteDataSource,
    private val local : CountryLocalDataSource
) : CountryRepository {
    override fun searchCountries(query: String): Flow<List<CountrySummary>> {
        val countryFlow = if (query.isBlank()) {
            local.getCountries()
        } else {
            local.searchCountries(query)
        }
        return countryFlow.map { entities -> entities.map { entity -> entity.toDomain() } }
    }

    override suspend fun syncIfNeeded() {
        if(local.count() == 0L) {
            val entities = remote.getCountries().map { country ->
                country.toEntity()
            }
            local.insertAll(entities)
        }
    }

    override suspend fun getCountryByCode(code: String): CountryDetail {
        remote.getCountryByCode(code = code).also { response ->
            return response.toDomain()
        }
    }

}