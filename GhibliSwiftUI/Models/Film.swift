//
//  Film.swift
//  GhibliSwiftUI
//
//  Created by Lee Sangoroh on 03/06/2026.
//

import Foundation

struct Film: Codable, Identifiable, Equatable {
    let id: String
    let title: String
    let description: String
    //let releaseDate: Date
    let director: String
    let producer: String
    
    let releaseYear: String
    let score: String
    let duration: String
    let image: String
    let bannerImage: String
    
    let people: [String]
    
    enum CodingKeys: String, CodingKey {
        case id, title, image, description, director, producer, people
        
        case bannerImage = "movie_banner"
        case releaseYear = "release_date"
        case duration = "running_time"
        case score = "rt_score"
    }
}

import Playgrounds

#Playground {
    
    let url = URL(string: "https://ghibliapi.vercel.app/films")!
    
    do {
        let (data, response) = try await
        URLSession.shared.data(from: url)
        
        try JSONDecoder().decode([Film].self, from: data)
    } catch {
        print(error)
    }
}
