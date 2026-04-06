package com.example.countriescckmp.data.remote.dto

import kotlinx.serialization.Serializable

@Serializable
data class CountryDto(
    val name: NameDetails,
    val cca3 : String
)
@Serializable
data class NameDetails(
    val common: String,
    val official: String,
    val nativeName: Map<String, NativeNameDetails>
)

@Serializable
data class NativeNameDetails (
    val official : String,
    val common : String
)