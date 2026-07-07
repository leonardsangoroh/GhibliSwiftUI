//
//  FilmListView.swift
//  GhibliSwiftUI
//
//  Created by Lee Sangoroh on 04/06/2026.
//

import SwiftUI
import Observation


struct FilmListView: View {
    
    var films: [Film]
    var favoritesViewModel: FavoritesViewModel
    
    var body: some View {
                List(films) { film in
                    NavigationLink(value: film) {
                        FilmRow(film: film, favoritesViewModel: favoritesViewModel)
                    }
                }
                .navigationDestination(for: Film.self) { film in
                    FilmDetailView(film: film)
                }
            }
    
}

private struct FilmRow: View {
    
    var film: Film
    var favoritesViewModel: FavoritesViewModel
    var isFavorite: Bool {
        favoritesViewModel.isFavorite(filmID: film.id)
    }
    
    var body: some View {
        HStack {
            FilmImageView(urlPath: film.image)
                .frame(width: 100, height: 150)
            Text(film.title)
            
            Button {
                favoritesViewModel.toggleFavorite(filmID: film.id)
            } label: {
                Image(systemName: isFavorite ? "heart.fill" : "heart")
                    .foregroundStyle(isFavorite ? Color.pink : Color.gray)
            }
            .buttonStyle(.plain)
        }
    }
}


#Preview {
    
    @State @Previewable var favorites = FavoritesViewModel(service: MockFavoriteStorage())
    NavigationStack {
        FilmListView(films: [Film.example], favoritesViewModel: favorites)
    }
    .task {
        await favorites.load()
    }
}

