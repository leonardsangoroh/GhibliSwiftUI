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
    
    var state: LoadingState<[Film]> = .idle
    
    private let service: APIService
    
    init(service: APIService = DefaultAPIService()) {
        self.service = service
    }
    
    func fetch() async {
        
        guard !state.isLoading || state.error != nil else { return }
        
        state = .loading
        var films: [Film] = []
        
        do {
            films = try await service.fetchFilms()
            state = .loaded(films)
        } catch {
            state = .error(error.localizedDescription)
        }
    }
    
}
