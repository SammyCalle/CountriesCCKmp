package com.example.countriescckmp.data.local

import app.cash.sqldelight.coroutines.asFlow
import app.cash.sqldelight.coroutines.mapToList
import com.countriescckmp.db.AppDatabase
import com.countriescckmp.db.CountryEntity
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.IO
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.withContext

class CountryLocalDataSource(private val db : AppDatabase) {

    private val queries = db.countryQueries

    fun getCountries() : Flow<List<CountryEntity>> =
        queries.getAllCountries()
            .asFlow()
            .mapToList(Dispatchers.IO)

    suspend fun count() : Long =
        withContext(Dispatchers.IO){
            queries.count().executeAsOne()
        }

    fun searchCountries(query : String): Flow<List<CountryEntity>> =
        queries.searchCountries("$query%")
            .asFlow()
            .mapToList(Dispatchers.IO)

    suspend fun insertAll(countries : List<CountryEntity>) =
        withContext(Dispatchers.IO){
            db.transaction {
                countries.forEach { country ->
                    queries.insertAll(
                        name = country.name,
                        countryCode = country.countryCode
                    )
                }
            }
        }
}