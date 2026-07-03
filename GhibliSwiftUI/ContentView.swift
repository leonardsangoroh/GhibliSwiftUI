//
//  ContentView.swift
//  GhibliSwiftUI
//
//  Created by Lee Sangoroh on 03/06/2026.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Tab("Movies", systemImage: "movieclapper") {
                FilmsView()
            }
            Tab ("Favorites", systemImage: "heart"){
                FavoritesView()
            }
            Tab("Settings", systemImage: "gear") {
                SettingsView()
            }
            Tab (role: .search) {
                SearchView()
            }
        }
    }
}

#Preview {
    ContentView()
}
