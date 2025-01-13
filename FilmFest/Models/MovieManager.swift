//
//  MovieManager.swift
//  FilmFest
//
//  Created by Dipika Bari on 10/01/2025.
//

import Foundation

class MovieManager {
    var moviesToWatchCount: Int { return moviesToWatchArray.count }
    var moviesWatchedCount: Int { return moviesWatchedArray.count }
    
    private var moviesToWatchArray = [Movie]()
    private var moviesWatchedArray = [Movie]()
    
    func addMovie(movie: Movie) {
        if !moviesToWatchArray.contains(movie) {
            moviesToWatchArray.append(movie)
        }
    }
    
    func movieAtIndex(index: Int) -> Movie {
        return moviesToWatchArray[index]
    }
    
    func checkOffMovieAtIndex(index: Int){
        guard index < moviesToWatchCount else { return }
        
        let checkedMovie = moviesToWatchArray.remove(at: index)
        moviesWatchedArray.append(checkedMovie)
        
    }
    
    func checkedOffMovieAtIndex(index: Int) -> Movie {
        return moviesWatchedArray[index]
    }
    
    func clearArrays() {
        moviesToWatchArray.removeAll()
        moviesWatchedArray.removeAll()
    }
}
