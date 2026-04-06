package com.example.countriescckmp.presentation.detail

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.example.countriescckmp.domain.usecase.GetCountryDetailUseCase
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.launch

class DetailViewModel (
    private val getCountryDetailUseCase: GetCountryDetailUseCase
) : ViewModel() {

    private val _uiState = MutableStateFlow<DetailScreenUiState>(DetailScreenUiState.Loading)
    val uiState: StateFlow<DetailScreenUiState> = _uiState.asStateFlow()

    fun loadCountry(countryCode: String) {
        viewModelScope.launch {
            _uiState.value = DetailScreenUiState.Loading
            try {
                val detail = getCountryDetailUseCase(countryCode)
                _uiState.value = DetailScreenUiState.Success(detail)
            } catch (e: Exception) {
                _uiState.value = DetailScreenUiState.Error(e.message ?: "Unexpected error")
            }
        }
    }
}