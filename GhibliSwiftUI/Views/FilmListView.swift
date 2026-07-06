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
    
    var body: some View {
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
            }
    
}

/*
#Preview {
    
    @State @Previewable var vm = FilmsViewModel(service: MockAPIService())
    
    FilmListView(films: )
}
*/
