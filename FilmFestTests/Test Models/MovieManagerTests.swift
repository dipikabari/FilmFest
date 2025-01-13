//
//  MovieManagerTests.swift
//  FilmFestTests
//
//  Created by Dipika Bari on 10/01/2025.
//

import XCTest
@testable import FilmFest

final class MovieManagerTests: XCTestCase {
    // sut : system under test
    var sut: MovieManager!
    
    let scifiMovie = Movie(title: "Sci-Fi")
    let dramaMovie = Movie(title: "Drama")
    let romcomMovie = Movie(title: "Romantic Comedy")
    let actionMovie = Movie(title: "Action/Adventure")
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = MovieManager()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    // MARK: Initial Values
    func testInit_MoviesToWatch_ReturnsZero() {
        XCTAssertEqual(sut.moviesToWatchCount, 0)
    }

    func testInit_MoviesWatched_ReturnsZero() {
        XCTAssertEqual(sut.moviesWatchedCount, 0)
        
    }
    
    // MARK: Add & Query
    func testAdd_MoviesToSee_ReturnsOne() {
        sut.addMovie(movie: scifiMovie)
        
        XCTAssertEqual(sut.moviesToWatchCount, 1)
    }
    
    func testQuery_ReturnsMovieAtIndex() {
        sut.addMovie(movie: dramaMovie)
        
        let movieQueried = sut.movieAtIndex(index: 0)
        XCTAssertEqual(dramaMovie.title, movieQueried.title)
    }
    
    // MARK: Checking Off
    func testCheckOffMovie_UpdatesMovieManagerCounts() {
        sut.addMovie(movie: actionMovie)
        sut.checkOffMovieAtIndex(index: 0)
        
        XCTAssertEqual(sut.moviesToWatchCount, 0)
        XCTAssertEqual(sut.moviesWatchedCount, 1)
    }
    
    func testCheckOffMovie_RemovesMovieFromArray() {
        sut.addMovie(movie: scifiMovie)
        sut.addMovie(movie: romcomMovie)
        sut.checkOffMovieAtIndex(index: 0)
        
        XCTAssertEqual(sut.movieAtIndex(index: 0).title, romcomMovie.title)
    }
    
    func testCheckOffMovie_ReturnsMovieAtIndex() {
        sut.addMovie(movie: scifiMovie)
        sut.checkOffMovieAtIndex(index: 0)
        
        let movieQueried = sut.checkedOffMovieAtIndex(index: 0)
        XCTAssertEqual(scifiMovie.title, movieQueried.title)
    }
    
    // MARK: Clearing and Resetting
    func testClearArrays_ReturnsArrayCountsOfZero() {
        sut.addMovie(movie: scifiMovie)
        sut.addMovie(movie: actionMovie)
        sut.checkOffMovieAtIndex(index: 0)
        
        XCTAssertEqual(sut.moviesToWatchCount, 1)
        XCTAssertEqual(sut.moviesToWatchCount, 1)
        
        sut.clearArrays()
        
        XCTAssertEqual(sut.moviesToWatchCount, 0)
        XCTAssertEqual(sut.moviesToWatchCount, 0)
    }
    
    // MARK: Duplicates
    func testDuplicateMovies_ShouldNotBeAddedToArray() {
        sut.addMovie(movie: scifiMovie)
        sut.addMovie(movie: scifiMovie)
        
        XCTAssertEqual(sut.moviesToWatchCount, 1)
    }
}
