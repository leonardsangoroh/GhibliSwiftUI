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
    
    private let service: FavoriteStorage
    
    init(service: FavoriteStorage = DefaultFavoriteStorage()) {
        self.service = service
        self.favoriteIDs = service.load()
        //debug prints
        print("Fav IDs")
        print(favoriteIDs)
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
