//
//  FilmDetailViewModel.swift
//  GhibliSwiftUI
//
//  Created by Lee Sangoroh on 11/06/2026.
//

import Foundation
import Observation

class FilmDetailViewModel {
    var people: [Person] = []
    
    let service: APIService
    
    init(service: APIService = DefaultAPIService()) {
        self.service = service
    }
    
    func fetch(for film: Film) async {
        
        do {
            try await withThrowingTaskGroup(of: Person.self) { group in
                for personInfoURL in film.people {
                    group.addTask {
                        try await self.service.fetchPerson(from: personInfoURL)
                    }
                }
                
                // collect results as they complete
                for try await person in group {
                    people.append(person)
                }
            }
            
        } catch {
            
        }
    }
    
    
}

import Playgrounds
#Playground {
    let vm = FilmDetailViewModel()
    
    let film = try await MockAPIService().fetchFilm()
    await vm.fetch(for: film)
    
    for person in vm.people {
        print(person)
    }
}
