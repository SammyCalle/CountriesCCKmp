package com.example.countriescckmp.data.mapper

import com.countriescckmp.db.CountryEntity
import com.example.countriescckmp.data.remote.dto.CountryDetailResponseDto
import com.example.countriescckmp.data.remote.dto.CountryDto
import com.example.countriescckmp.domain.model.CountryDetail
import com.example.countriescckmp.domain.model.CountrySummary

fun CountryEntity.toDomain() : CountrySummary {
    return CountrySummary(
        name = name,
        code = countryCode
    )
}

fun CountryDto.toEntity() : CountryEntity {
    return CountryEntity(
        name = name.common,
        countryCode = cca3
    )
}

fun CountryDetailResponseDto.toDomain() : CountryDetail {
    return CountryDetail(
        name = name.common,
        coatOfArms = coatOfArms.png,
        flag = flags.png,
        flagDescription = flags.alt,
        currencyName = currencies.values.map { currency -> currency.name },
        capital = capital,
        population = population,
        languages = languages.values.toList(),
        continents = continents,
        timezones = timezones,
        googleMaps = maps.googleMaps
    )
}