//
//  FilmDetailViewModel.swift
//  GhibliSwiftUI
//
//  Created by Lee Sangoroh on 11/06/2026.
//

import Foundation
import Observation

@Observable
class FilmDetailViewModel {
    
    enum State: Equatable {
        case idle
        case loading
        case loaded([Person])
        case error(String)
    }
    
    var state:State = .idle
    
    private let service: APIService
    
    init(service: APIService = DefaultAPIService()) {
        self.service = service
    }
    
    func fetch(for film: Film) async {
        
        guard state != .loading else { return }
        
        state = .loading
        var loadedPeople: [Person] = []
        
        do {
            try await withThrowingTaskGroup(of: Person.self) { group in
                for personInfoURL in film.people {
                    group.addTask {
                        try await self.service.fetchPerson(from: personInfoURL)
                    }
                }
                
                // collect results as they complete
                for try await person in group {
                    loadedPeople.append(person)
                }
            }
            
            state = .loaded(loadedPeople)
            
        } catch {
            
        }
    }
    
    
}

import Playgrounds
#Playground {
    let vm = FilmDetailViewModel()
    
    let film = try await MockAPIService().fetchFilm()
    await vm.fetch(for: film)
    
    switch vm.state {
    case .idle:
        print("idle")
    case .loading:
        print("loading")
    case .loaded(let people):
        for person in people {
            print(person)
        }
    case .error(let string):
        print(string)
    }
}
