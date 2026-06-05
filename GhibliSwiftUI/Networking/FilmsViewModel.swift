//
//  FilmsViewModel.swift
//  GhibliSwiftUI
//
//  Created by Lee Sangoroh on 04/06/2026.
//

import Foundation
import Observation

enum APIError: LocalizedError {
    case invalidURL
    case invalidResponse
    case decoding(Error)
    case networkError(Error)
}

@Observable
class FilmsViewModel {
    
    enum State: Equatable {
        case idle
        case loading
        case loaded([Film])
        case error(String)
    }
    
    var state: State = .idle
    var films: [Film] = []
    
    func fetch() async {
        
        guard state == .idle else { return }
        
        state = .loading
        
        do {
            films = try await fetchFilms()
            state = .loaded(films)
        } catch {
            state = .error(error.localizedDescription)
        }
    }
    
    
    private func fetchFilms() async throws -> [Film] {
        guard let url = URL(string: "https://ghibliapi.vercel.app/films") else {
            throw APIError.invalidURL
        }
        
        //check http response
        guard let httpResponse = try await URLSession.shared.data(from: url).1 as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
            throw APIError.invalidResponse
        }
        
        do {
            let (data, response) = try await
            URLSession.shared.data(from: url)
            
            films = try JSONDecoder().decode([Film].self, from: data)
            
            return films
            
        } catch let error as DecodingError{
            throw APIError.decoding(error)
        } catch let error as URLError {
            throw APIError.networkError(error)
        }
    }
}
