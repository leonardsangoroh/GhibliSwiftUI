//
//  MockFavoriteStorage.swift
//  GhibliSwiftUI
//
//  Created by Lee Sangoroh on 06/07/2026.
//

import Foundation

struct MockFavoriteStorage: FavoriteStorage {
    
    func load() -> Set<String> {
        ["2baf70d1-42bb-4437-b551-e5fed5a87abe"]
    }
    
    func save(favoriteIDs: Set<String>) {
        
    }
}
