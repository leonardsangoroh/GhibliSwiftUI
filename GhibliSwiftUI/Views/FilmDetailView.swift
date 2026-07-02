//
//  FilmDetailView.swift
//  GhibliSwiftUI
//
//  Created by Lee Sangoroh on 02/07/2026.
//

import SwiftUI

struct FilmDetailView: View {
    
    let film: Film
    
    var body: some View {
        Text(film.title)
    }
}

#Preview {
    FilmDetailView(film: Film.example)
}
