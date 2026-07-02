//
//  FilmListView.swift
//  GhibliSwiftUI
//
//  Created by Lee Sangoroh on 04/06/2026.
//

import SwiftUI
import Observation


struct FilmListView: View {
    
    var filmsViewModel = FilmsViewModel()
    
    var body: some View {
        
        NavigationStack {
            switch filmsViewModel.state {
                case .idle:
                    Text("No films yet.")
                
                case .loading:
                ProgressView {
                    Text("Loading...")
                }
                
                case .loaded(let films):
                List(films) { film in
                    NavigationLink(value: film) {
                        HStack {
                            FilmImageView(urlPath: film.image)
                                .frame(width: 100, height: 150)
                            Text(film.title)
                        }
                    }
                }
                .navigationDestination(for: Film.self) { film in
                    FilmDetailView(film: film)
                }
                case .error(let error):
                Text(error)
                    .foregroundStyle(Color.red)
            }
        }
        .task {
            await filmsViewModel.fetch()
        }
    }
    
}

#Preview {
    
    @State @Previewable var vm = FilmsViewModel(service: MockAPIService())
    
    FilmListView(filmsViewModel: vm)
}
