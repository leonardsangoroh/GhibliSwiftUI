//
//  SearchFilmsViewModel.swift
//  GhibliSwiftUI
//
//  Created by Lee Sangoroh on 09/07/2026.
//

import Foundation

@Observable
class SearchFilmsViewModel {
    
    var state: LoadingState<[Film]> = .idle
    
    private let service: APIService
    
    init(service: APIService = DefaultAPIService()) {
        self.service = service
    }
    
    func fetch(for searchTerm: String) async {
        
        // seconds delay
        try? await Task.sleep(for: .milliseconds(500))
        
        guard !searchTerm.isEmpty else {
            return
        }
        
        state = .loading
        
        do {
            let films = try await service.searchFilm(for: searchTerm)
            state = .loaded(films)
        } catch let error as APIError {
            self.state = .error(error.errorDescription ?? "Unknown Error")
        } catch {
            self.state = .error(error.localizedDescription)
        }
    }
}

