//
//  ContentView.swift
//  GhibliSwiftUI
//
//  Created by Lee Sangoroh on 03/06/2026.
//

import SwiftUI

struct ContentView: View {
    
    @State private var filmsViewModel = FilmsViewModel()
    @State private var favoritesViewModel = FavoritesViewModel()
    
    var body: some View {
        TabView {
            Tab("Movies", systemImage: "movieclapper") {
                FilmsView(filmsViewModel: FilmsViewModel(), favoritesViewModel: favoritesViewModel)
            }
            Tab ("Favorites", systemImage: "heart"){
                FavoritesView(filmsViewModel: FilmsViewModel(), favoritesViewModel: favoritesViewModel)
            }
            Tab("Settings", systemImage: "gear") {
                SettingsView()
            }
            Tab (role: .search) {
                SearchView()
            }
        }
        .task {
            favoritesViewModel.load()
            await filmsViewModel.fetch()
        }
    }
}

#Preview {
    ContentView()
}
