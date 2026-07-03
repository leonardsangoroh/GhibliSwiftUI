//
//  SearchView.swift
//  GhibliSwiftUI
//
//  Created by Lee Sangoroh on 02/07/2026.
//

import SwiftUI

struct SearchView: View {
    
    @State private var text: String = ""
    
    var body: some View {
        NavigationStack {
            Text("Search View")
                .searchable(text: $text)
        }
    }
}

#Preview {
    SearchView()
}
