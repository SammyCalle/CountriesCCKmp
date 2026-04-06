package com.example.countriescckmp.di

import com.example.countriescckmp.presentation.detail.DetailViewModel
import com.example.countriescckmp.presentation.search.SearchViewModel
import org.koin.core.component.KoinComponent
import org.koin.core.component.inject

class SearchViewModelHelper : KoinComponent {
    val viewModel : SearchViewModel by inject()
}

class DetailViewModelHelper : KoinComponent {
    val viewModel : DetailViewModel by inject()
}