//
//  APIService.swift
//  GhibliSwiftUI
//
//  Created by Lee Sangoroh on 08/06/2026.
//

import Foundation

protocol APIService {
    func fetchFilms() async throws -> [Film]
    //func fetchPerson(from URLString: String) async throws -> Person
}
