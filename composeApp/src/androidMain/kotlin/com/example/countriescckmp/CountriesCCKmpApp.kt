package com.example.countriescckmp

import android.app.Application
import com.example.countriescckmp.di.initKoin
import org.koin.android.ext.koin.androidContext
import org.koin.android.ext.koin.androidLogger

class CountriesCCKmpApp : Application() {
    override fun onCreate() {
        super.onCreate()
        initKoin {
            androidContext(this@CountriesCCKmpApp)
            androidLogger()
        }
    }
}