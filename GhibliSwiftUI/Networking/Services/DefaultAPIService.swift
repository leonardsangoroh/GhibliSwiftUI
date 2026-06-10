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
    
    func fetchFilms() async throws -> [Film] {
        guard let url = URL(string: "https://ghibliapi.vercel.app/films") else {
            throw APIError.invalidURL
        }
        
        //check http response
        guard let httpResponse = try await URLSession.shared.data(from: url).1 as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
            throw APIError.invalidResponse
        }
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            
            let films = try JSONDecoder().decode([Film].self, from: data)
            
            return films
            
        } catch let error as DecodingError{
            throw APIError.decoding(error)
        } catch let error as URLError {
            throw APIError.networkError(error)
        }
    }
}
