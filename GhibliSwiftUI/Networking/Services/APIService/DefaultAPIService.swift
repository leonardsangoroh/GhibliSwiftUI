//
//  DefaultAPIService.swift
//  GhibliSwiftUI
//
//  Created by Lee Sangoroh on 08/06/2026.
//
//  A service holds only pure functions - they don't hold any mutable states that can changed during runtime
// Some services hold mutable states e.g. Refresh token service

import Foundation

struct DefaultAPIService: APIService {
    
    func fetch<T: Decodable>(from URLString: String, type: T.Type) async throws -> T {
        
        guard let url = URL(string: URLString) else {
            throw APIError.invalidURL
        }
        
        //check http response
        guard let httpResponse = try await URLSession.shared.data(from: url).1 as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
            throw APIError.invalidResponse
        }
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            
            let data_array = try JSONDecoder().decode(type, from: data)
            
            return data_array
            
        } catch let error as DecodingError{
            throw APIError.decoding(error)
        } catch let error as URLError {
            throw APIError.networkError(error)
        }
    }
    
    func fetchFilms() async throws -> [Film] {
        return try await fetch(from: "https://ghibliapi.vercel.app/films", type: [Film].self)
    }
    
    func searchFilm(for searchTerm: String) async throws -> [Film] {
        let allFilms = try await fetchFilms()
        
        return allFilms.filter { film in
            film.title.localizedStandardContains(searchTerm)
            //film.title.lowercased().contains(searchTerm.lowercased())
        }
    }
    
    func fetchPerson(from URLString: String) async throws -> Person {
        return try await fetch(from: URLString, type: Person.self)
    }
}
