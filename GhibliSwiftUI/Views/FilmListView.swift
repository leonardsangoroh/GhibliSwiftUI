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
        
        NavigationStack {
            switch filmsViewModel.state {
                case .idle:
                    Text("No films yet.")
                
                case .loading:
                ProgressView {
                    Text("Loading...")
                }
                
                case .loaded(let films):
                List(films) { films in
                    Text(films.title)
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
    FilmListView()
}
