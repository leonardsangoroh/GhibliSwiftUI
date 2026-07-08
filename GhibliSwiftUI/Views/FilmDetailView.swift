//
//  FilmDetailView.swift
//  GhibliSwiftUI
//
//  Created by Lee Sangoroh on 02/07/2026.
//

import SwiftUI

struct FilmDetailView: View {
    
    let film: Film
    var favoritesViewModel: FavoritesViewModel
    
    @State private var viewModel = FilmDetailViewModel()
    
    var body: some View {
        ScrollView {
            VStack {
                VStack {
                    
                    FilmImageView(urlPath: film.bannerImage)
                        .frame(height: 300)
                    
                    VStack {
                        Text(film.title)
                        
                        Divider()
                        
                        switch viewModel.state {
                        case .idle: EmptyView()
                        case .loading: ProgressView()
                        case .loaded(let people):
                            ForEach(people) { person in
                                Text(person.name)
                            }
                        case .error(let error):
                            Text(error.localizedCapitalized)
                                .foregroundStyle(.pink)
                        }
                    }
                    .padding()
                }
                .toolbar {
                    FavoriteButton(filmID: film.id, favoritesViewModel: favoritesViewModel)
                }
                .task {
                    await viewModel.fetch(for: film)
                }
            }
        }
    }
}



#Preview {
    NavigationStack {
        FilmDetailView(film: Film.example,  favoritesViewModel: FavoritesViewModel())
    }
}
