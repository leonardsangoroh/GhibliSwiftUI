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
    
    func fetchFilms() async throws -> [Film] {
        
        let data = try loadSampleData()
        
        return data.films
    }
}
