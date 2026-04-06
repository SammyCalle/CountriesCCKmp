package com.example.countriescckmp.data.remote.dto

import kotlinx.serialization.Serializable

@Serializable
data class CountryDetailResponseDto(
    val flags: CountryFlag,
    val coatOfArms: CountryCoatOfArms,
    val name: NameDetails,
    val currencies: Map<String, CountryCurrency>,
    val languages: Map<String, String>,
    val capital: List<String>,
    val maps: CountryMap,
    val population: Int,
    val timezones: List<String>,
    val continents: List<String>
)

@Serializable
data class CountryCurrency(
    val name: String,
    val symbol: String
)
@Serializable
data class CountryMap(
    val googleMaps: String,
    val openStreetMaps: String
)
@Serializable
class CountryFlag(
    val png: String,
    val svg: String,
    val alt: String
)
@Serializable
class CountryCoatOfArms(
    val png: String,
    val svg: String
)