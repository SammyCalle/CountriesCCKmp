package com.example.countriescckmp.di

import com.example.countriescckmp.data.local.CountryLocalDataSource
import com.example.countriescckmp.db.createDatabase
import org.koin.dsl.module

val databaseModule = module {
    single { createDatabase(get()) }
    single { CountryLocalDataSource(get()) }
}