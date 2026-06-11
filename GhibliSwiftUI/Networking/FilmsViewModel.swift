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
    
    enum State: Equatable {
        case idle
        case loading
        case loaded([Film])
        case error(String)
    }
    
    var state: State = .idle
    var films: [Film] = []
    
    private let service: APIService
    
    init(service: APIService = DefaultAPIService()) {
        self.service = service
    }
    
    func fetch() async {
        
        guard state == .idle else { return }
        
        state = .loading
        
        do {
            films = try await service.fetchFilms()
            state = .loaded(films)
        } catch {
            state = .error(error.localizedDescription)
        }
    }
    
}
