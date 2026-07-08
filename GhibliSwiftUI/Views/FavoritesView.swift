//
//  FavoritesView.swift
//  GhibliSwiftUI
//
//  Created by Lee Sangoroh on 02/07/2026.
//

import SwiftUI

struct FavoritesView: View {
    
    let filmsViewModel: FilmsViewModel
    let favoritesViewModel: FavoritesViewModel
    var films:[Film] {
        let favorites = favoritesViewModel.favoriteIDs
        
        switch filmsViewModel.state {
        case .loaded(let films):
            return films.filter { favorites.contains($0.id) }
        default:
            return []
        }
        
    }
    
    var body: some View {
        NavigationStack {
            Group {
                if films.isEmpty {
                    ContentUnavailableView("No favorites yet", systemImage: "heart")
                } else {
                    FilmListView(films: films, favoritesViewModel: favoritesViewModel)
                }
            }
            .navigationTitle(Text("Favorites"))
        }
    }
}

#Preview {
    FavoritesView(filmsViewModel: FilmsViewModel(service: MockAPIService()), favoritesViewModel: FavoritesViewModel(service: MockFavoriteStorage()))
}
