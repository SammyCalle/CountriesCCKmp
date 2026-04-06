package com.example.countriescckmp.navigation

import androidx.compose.runtime.Composable
import androidx.compose.runtime.LaunchedEffect
import androidx.compose.runtime.getValue
import androidx.lifecycle.compose.collectAsStateWithLifecycle
import androidx.navigation.compose.NavHost
import androidx.navigation.compose.composable
import androidx.navigation.compose.rememberNavController
import com.example.countriescckmp.presentation.detail.DetailViewModel
import com.example.countriescckmp.presentation.search.SearchViewModel
import com.example.countriescckmp.ui.detail.DetailScreen
import com.example.countriescckmp.ui.search.SearchScreen
import org.koin.compose.viewmodel.koinViewModel

@Composable
fun AppNavGraph() {
    val navController = rememberNavController()

    NavHost(
        navController = navController,
        startDestination = Screen.SearchScreen.route
    ) {
        composable(Screen.SearchScreen.route) {
            val viewModel: SearchViewModel = koinViewModel()

            val query by viewModel.query.collectAsStateWithLifecycle()
            val uiState by viewModel.uiState.collectAsStateWithLifecycle()

            SearchScreen(
                query = query,
                uiState = uiState,
                onQueryChange = viewModel::onQueryChange,
                onCountryClick = { countryCode ->
                    navController.navigate(Screen.DetailScreen.createRoute(countryCode))
                }
            )
        }

        composable(
            route = Screen.DetailScreen.route,
            arguments = Screen.DetailScreen.arguments
        ) { backStackEntry ->
            val countryCode =
                backStackEntry.arguments?.getString("countryCode") ?: return@composable

            val viewModel: DetailViewModel = koinViewModel()

            LaunchedEffect(countryCode) {
                viewModel.loadCountry(countryCode)
            }

            val uiState by viewModel.uiState.collectAsStateWithLifecycle()
            DetailScreen(uiState = uiState, onBackClick = { navController.popBackStack() })
        }
    }
}