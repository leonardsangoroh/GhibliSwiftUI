//
//  FilmsViewModel.swift
//  GhibliSwiftUI
//
//  Created by Lee Sangoroh on 04/06/2026.
//

import Foundation
import Observation

@Observable
class FilmsViewModel {
    var films: [Film] = []
    
    func fetchFilms() async {
        let url = URL(string: "https://ghibliapi.vercel.app/films")!
        
        do {
            let (data, response) = try await
            URLSession.shared.data(from: url)
            
            films = try JSONDecoder().decode([Film].self, from: data)
        } catch {
            print(error)
        }
    }
}
