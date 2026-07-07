//
//  FavoritesViewModel.swift
//  GhibliSwiftUI
//
//  Created by Lee Sangoroh on 03/07/2026.
//

import Foundation

@Observable
class FavoritesViewModel {
    
    private(set) var favoriteIDs: Set<String> = []
    
    private let service = DefaultFavoriteStorage()
    
    init(service: FavoriteStorage = DefaultFavoriteStorage()) {
        self.favoriteIDs = favoriteIDs
    }
    
    // store in user defaults
    func load () {
        favoriteIDs = service.load()
    }
    
    private func save () {
        service.save(favoriteIDs: favoriteIDs)
    }
    
    func toggleFavorite (filmID: String) {
        if favoriteIDs.contains(filmID) {
            favoriteIDs.remove(filmID)
        } else {
            favoriteIDs.insert(filmID)
        }
        
        save()
    }
    
    func isFavorite (filmID: String) -> Bool {
        return favoriteIDs.contains(filmID)
    }
}
