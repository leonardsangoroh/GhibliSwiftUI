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
                    FilmDetailView(film: film, favoritesViewModel: favoritesViewModel)
                }
            }
    
}

private struct FilmRow: View {
    
    var film: Film
    var favoritesViewModel: FavoritesViewModel

    
    var body: some View {
        HStack {
            FilmImageView(urlPath: film.image)
                .frame(width: 100, height: 150)
            
            VStack(alignment: .leading) {
                HStack {
                    Text(film.title)
                        .bold()
                    
                    FavoriteButton(filmID: film.id, favoritesViewModel: favoritesViewModel)
                    .buttonStyle(.plain)
                    .controlSize(.large)
                }
                .padding(.bottom, 5)
                
                Text("Directed by: \(film.director)")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                
                Text("Released: \(film.releaseYear)")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
            .padding(.top)
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

