package com.example.countriescckmp.di

import com.example.countriescckmp.presentation.detail.DetailScreenUiState
import com.example.countriescckmp.presentation.detail.DetailViewModel
import com.example.countriescckmp.presentation.search.SearchScreenUiState
import com.example.countriescckmp.presentation.search.SearchViewModel
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.Job
import kotlinx.coroutines.launch
import org.koin.core.component.KoinComponent
import org.koin.core.component.inject

class SearchViewModelHelper : KoinComponent {
    val viewModel : SearchViewModel by inject()

    fun observeUiState(onChange: (SearchScreenUiState) -> Unit): Job {
        val scope = CoroutineScope(Dispatchers.Main)
        return scope.launch {
            viewModel.uiState.collect { onChange(it) }
        }
    }

    fun observeQuery(onChange: (String) -> Unit): Job {
        val scope = CoroutineScope(Dispatchers.Main)
        return scope.launch {
            viewModel.query.collect { onChange(it) }
        }
    }
}

class DetailViewModelHelper : KoinComponent {
    val viewModel : DetailViewModel by inject()

    fun observeUiState(onChange: (DetailScreenUiState) -> Unit): Job {
        val scope = CoroutineScope(Dispatchers.Main)
        return scope.launch {
            viewModel.uiState.collect { onChange(it) }
        }
    }
}