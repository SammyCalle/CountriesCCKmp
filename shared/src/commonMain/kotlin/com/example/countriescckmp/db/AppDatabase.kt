package com.example.countriescckmp.db

import com.countriescckmp.db.AppDatabase

fun createDatabase(driverFactory: DatabaseDriverFactory) : AppDatabase {
    val driver = driverFactory.createDriver()
    return AppDatabase(driver)
}