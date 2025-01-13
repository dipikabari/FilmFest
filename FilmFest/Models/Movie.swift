//
//  Movie.swift
//  FilmFest
//
//  Created by Dipika Bari on 10/01/2025.
//

import Foundation

struct Movie: Equatable {
    let title: String
    let releaseDate: String?
    
    init(title: String, releaseDate: String? = nil) {
        self.title = title
        self.releaseDate = releaseDate
    }
}
