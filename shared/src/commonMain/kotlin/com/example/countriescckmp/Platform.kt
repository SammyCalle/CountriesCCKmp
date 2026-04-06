package com.example.countriescckmp

interface Platform {
    val name: String
}

expect fun getPlatform(): Platform