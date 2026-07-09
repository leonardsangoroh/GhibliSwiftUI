//
//  DefaultFavoriteStorage.swift
//  GhibliSwiftUI
//
//  Created by Lee Sangoroh on 06/07/2026.
//

import Foundation

struct DefaultFavoriteStorage: FavoriteStorage {
    
    private let favoritesKey: String = "GhibliExplorer.FavoriteFilms"
    
    func load()-> Set<String> {
        let array = UserDefaults.standard.stringArray(forKey: favoritesKey) ?? []
        return Set(array)
    }
    
    func save(favoriteIDs: Set<String>) {
        UserDefaults.standard.set(Array(favoriteIDs), forKey: favoritesKey)
    }
}
