package com.example.countriescckmp.data.remote.api

import com.example.countriescckmp.data.remote.dto.CountryDetailResponseDto
import com.example.countriescckmp.data.remote.dto.CountryDto
import io.ktor.client.HttpClient
import io.ktor.client.call.body
import io.ktor.client.request.get

class CountryRemoteDataSource(private val client : HttpClient) {
    private val baseUrl = "https://restcountries.com/v3.1"

    suspend fun getCountries(): List<CountryDto> =
        client.get("$baseUrl/all?fields=name,cca3").body()

    suspend fun getCountryByCode(code: String): CountryDetailResponseDto =
        client.get("$baseUrl/alpha/$code?fields=name,capital,continents,maps,population,timezones,currencies,languages,flags,coatOfArms")
            .body()

}