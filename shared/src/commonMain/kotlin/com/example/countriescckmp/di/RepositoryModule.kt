package com.example.countriescckmp.di

import com.example.countriescckmp.data.repository.CountryRepositoryImpl
import com.example.countriescckmp.domain.repository.CountryRepository
import org.koin.dsl.module

val repositoryModule = module {
    single<CountryRepository> {
        CountryRepositoryImpl(
            remote = get(),
            local = get()
        )
    }
}