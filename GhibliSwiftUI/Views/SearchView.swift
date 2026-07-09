//
//  SearchView.swift
//  GhibliSwiftUI
//
//  Created by Lee Sangoroh on 02/07/2026.
//

import SwiftUI

struct SearchView: View {
    
    @State private var text: String = ""
    @State private var searchViewModel: SearchFilmsViewModel
    let favoritesViewModel: FavoritesViewModel
    
    init(favoriteViewModel: FavoritesViewModel, service: APIService = DefaultAPIService()) {
        self.favoritesViewModel = favoriteViewModel
        self.searchViewModel = SearchFilmsViewModel(service: service)
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                switch searchViewModel.state {
                    case .idle:
                        Text("Search View")
      
                    case .loading:
                        ProgressView()
                    case .loaded(let films):
                        FilmListView(films: films, favoritesViewModel: favoritesViewModel)
                    case .error(let error):
                        Text(error)
                }

            }
            .searchable(text: $text)
            .task(id: text) {
                //fetch for text
                await searchViewModel.fetch(for: text)
            }
        }
    }
}

#Preview {
    SearchView(favoriteViewModel: FavoritesViewModel(service: MockFavoriteStorage()))
}
