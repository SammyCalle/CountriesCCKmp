package com.example.countriescckmp.db

import android.content.Context
import app.cash.sqldelight.db.SqlDriver
import app.cash.sqldelight.driver.android.AndroidSqliteDriver
import com.countriescckmp.db.AppDatabase

actual class DatabaseDriverFactory(private val context: Context) {
    actual fun createDriver() : SqlDriver =
        AndroidSqliteDriver(AppDatabase.Companion.Schema, context, "app.db")
}