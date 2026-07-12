//
//  FilmsView.swift
//  GhibliSwiftUI
//
//  Created by Lee Sangoroh on 02/07/2026.
//

import SwiftUI

struct FilmsView: View {
    
    let filmsViewModel: FilmsViewModel
    let favoritesViewModel: FavoritesViewModel
    
    var body: some View {
    NavigationStack {
            
        Group {
            switch filmsViewModel.state {
                case .idle:
                    Text("No films yet.")
                    
                case .loading:
                    ProgressView {
                        Text("Loading...")
                    }
                    
                case .loaded(let films):
                    FilmListView(films: films, favoritesViewModel: favoritesViewModel)
                case .error(let error):
                    Text(error)
                        .foregroundStyle(Color.red)
            }
        }
        .navigationTitle("Ghibli Films")
        .task {
            await filmsViewModel.fetch()
        }
    }
    }
}

#Preview {
    FilmsView(filmsViewModel: FilmsViewModel(service: MockAPIService()), favoritesViewModel: FavoritesViewModel(service: MockFavoriteStorage()))
}
