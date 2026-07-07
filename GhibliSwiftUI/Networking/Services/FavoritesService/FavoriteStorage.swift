//
//  FavoriteStorage.swift
//  GhibliSwiftUI
//
//  Created by Lee Sangoroh on 03/07/2026.
//

import Foundation

protocol FavoriteStorage {
    func load() -> Set<String>
    func save(favoriteIDs: Set<String>)
}
