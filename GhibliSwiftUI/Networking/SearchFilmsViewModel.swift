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
    private var currentSearchTerm: String = ""
    
    private let service: APIService
    
    init(service: APIService = DefaultAPIService()) {
        self.service = service
    }
    
    func fetch(for searchTerm: String) async {
        
        self.currentSearchTerm = searchTerm
        
        guard !searchTerm.isEmpty else {
            state = .idle
            return
        }
        
        state = .loading
        
        // seconds delay
        try? await Task.sleep(for: .milliseconds(500))
        
        guard !searchTerm.isEmpty else {
            return
        }
        
        do {
            let films = try await service.searchFilm(for: searchTerm)
            state = .loaded(films)
        } catch let error as APIError {
            self.state = .error(error.errorDescription ?? "Unknown Error")
        } catch let error as CancellationError {
            if currentSearchTerm == searchTerm {
                self.state = .idle
            }
        } catch {
            self.state = .error(error.localizedDescription)
        }
    }
    
    func setError(_ error: Error, for searchTerm: String) {
        guard currentSearchTerm == searchTerm else {
            return
        }
        
        if let error = error as? APIError {
            self.state = .error(error.errorDescription ?? "Unknown Error")
        } else {
            self.state = .error(error.localizedDescription)
        }
    }
}

