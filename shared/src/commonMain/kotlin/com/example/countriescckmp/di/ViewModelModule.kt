package com.example.countriescckmp.di

import com.example.countriescckmp.presentation.detail.DetailViewModel
import com.example.countriescckmp.presentation.search.SearchViewModel
import org.koin.core.module.dsl.viewModelOf
import org.koin.dsl.module

val viewModelModule = module {
    viewModelOf(::SearchViewModel)
    viewModelOf(::DetailViewModel)
}