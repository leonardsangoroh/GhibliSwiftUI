//
//  FavoritesView.swift
//  GhibliSwiftUI
//
//  Created by Lee Sangoroh on 02/07/2026.
//

import SwiftUI

struct FavoritesView: View {
    
    let filmsViewModel: FilmsViewModel
    var films: [Film] {
        return []
    }
    
    var body: some View {
        NavigationStack {
            Group {
                if films.isEmpty {
                    ContentUnavailableView("No favorites yet", systemImage: "heart")
                } else {
                    FilmListView(films: films)
                }
            }
            .navigationTitle(Text("Favorites"))
        }
    }
}

#Preview {
    FavoritesView(filmsViewModel: FilmsViewModel(service: MockAPIService()))
}
