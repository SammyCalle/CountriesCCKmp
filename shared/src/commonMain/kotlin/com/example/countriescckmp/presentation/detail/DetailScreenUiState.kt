package com.example.countriescckmp.presentation.detail

import com.example.countriescckmp.domain.model.CountryDetail

sealed class DetailScreenUiState {
    object Loading : DetailScreenUiState()
    data class Success(val country: CountryDetail) : DetailScreenUiState()
    data class Error(val message: String) : DetailScreenUiState()
}