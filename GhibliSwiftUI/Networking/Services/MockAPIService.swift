//
//  MockAPIService.swift
//  GhibliSwiftUI
//
//  Created by Lee Sangoroh on 08/06/2026.
//

import Foundation

struct MockAPIService: APIService {
    
    private struct SampleData: Decodable {
        let films: [Film]
        let people: [Person]
    }
    
    // load SampleData.json bundled inside this project
    private func loadSampleData() throws -> SampleData {
    
        guard let url = Bundle.main.url(forResource: "SampleData", withExtension: "json") else {
            fatalError("Couldn't find sample data file.")
        }
        
        let data = try Data(contentsOf: url)
        return try JSONDecoder().decode(SampleData.self, from: data)
    }
    
    //MARK: - protocol conformance
    func fetchFilms() async throws -> [Film] {
        
        let data = try loadSampleData()
        
        return data.films
    }
    
    //MARK: - protocol conformance
    func fetchPerson(from URLString: String) async throws -> Person {
        let data = try loadSampleData()
        
        return data.people.first!
    }
    
    //MARK: - preview/test use only
    func fetchFilm() throws -> Film {
        
        let data = try loadSampleData()
        
        return data.films.first!
    }
}
