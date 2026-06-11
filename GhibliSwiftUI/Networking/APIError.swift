//
//  APIError.swift
//  GhibliSwiftUI
//
//  Created by Lee Sangoroh on 11/06/2026.
//

import Foundation

enum APIError: LocalizedError {
    case invalidURL
    case invalidResponse
    case decoding(Error)
    case networkError(Error)
}
