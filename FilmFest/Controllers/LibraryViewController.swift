//
//  ViewController.swift
//  FilmFest
//
//  Created by Dipika Bari on 10/01/2025.
//

import UIKit

class LibraryViewController: UIViewController {

    @IBOutlet weak var libraryTableView: UITableView!
    @IBOutlet var dataservice: MovieLibraryDataService!
    
    var movieManager = MovieManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.libraryTableView.dataSource = dataservice
        self.libraryTableView.delegate = dataservice
        
        dataservice.movieManager = movieManager
        
        dataservice.movieManager?.addMovie(movie: Movie(title: "Action",releaseDate: "2000"))
        dataservice.movieManager?.addMovie(movie: Movie(title: "Comedy",releaseDate: "2014"))
        dataservice.movieManager?.addMovie(movie: Movie(title: "FairyTale",releaseDate: "1987"))
        dataservice.movieManager?.addMovie(movie: Movie(title: "Drama",releaseDate: "2023"))
        dataservice.movieManager?.addMovie(movie: Movie(title: "Thriller",releaseDate: "2020"))
        
        libraryTableView.reloadData()
        
    }


}

