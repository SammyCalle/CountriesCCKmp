package com.example.countriescckmp.di

import com.example.countriescckmp.domain.usecase.GetCountriesUseCase
import com.example.countriescckmp.domain.usecase.GetCountryDetailUseCase
import com.example.countriescckmp.domain.usecase.SyncCountriesUseCase
import org.koin.dsl.module

val useCaseModule = module {
    factory { GetCountriesUseCase(get()) }
    factory { SyncCountriesUseCase(get()) }
    factory { GetCountryDetailUseCase(get()) }
}