//
//  FilmListView.swift
//  GhibliSwiftUI
//
//  Created by Lee Sangoroh on 04/06/2026.
//

import SwiftUI
import Observation


struct FilmListView: View {
    
    @State private var filmsViewModel = FilmsViewModel()
    
    var body: some View {
        List(filmsViewModel.films) { film in
            Text(film.title)
        }
        .task {
            await filmsViewModel.fetchFilms()
        }
    }
}

#Preview {
    FilmListView()
}
