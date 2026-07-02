//
//  FilmImageView.swift
//  GhibliSwiftUI
//
//  Created by Lee Sangoroh on 02/07/2026.
//

import SwiftUI

struct FilmImageView: View {
    
    let urlPath: String
    
    var body: some View {
        AsyncImage(url: URL(string: urlPath)) { phase in
            switch phase {
                case .empty:
                Color(white: 0.8)
                    .overlay {
                        ProgressView()
                            .controlSize(.large)
                    }
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFill()
                        .clipped()
                case .failure(let error):
                    Text("Could not get image")
                default:
                        fatalError()
            }
        }
    }
}

#Preview ("poster image") {
    FilmImageView(urlPath: "https://image.tmdb.org/t/p/w600_and_h900_bestv2/qG3RYlIVpTYclR9TYIsy8p7m7AT.jpg")
        .frame(height: 150)
}

#Preview ("banner image") {
    FilmImageView(urlPath: "https://image.tmdb.org/t/p/original/vkZSd0Lp8iCVBGpFH9L7LzLusjS.jpg")
        .frame(height: 200)
}


