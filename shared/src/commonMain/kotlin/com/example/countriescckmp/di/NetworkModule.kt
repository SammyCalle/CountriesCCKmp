package com.example.countriescckmp.di

import com.example.countriescckmp.data.remote.api.CountryRemoteDataSource
import com.example.countriescckmp.data.remote.api.createHttpClient
import org.koin.dsl.module

val networkModule = module {
    single { createHttpClient() }
    single { CountryRemoteDataSource(get()) }
}
