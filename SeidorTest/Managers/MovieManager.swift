//
//  MovieManager.swift
//  SeidorTest
//
//  Created by Matías Contreras Selman on 02-05-18.
//  Copyright © 2018 Matias Contreras. All rights reserved.
//

import Foundation
import SwiftyJSON

class MovieManager{
    static let shared = MovieManager()
    
    struct Keys{
        static let results = "results"
    }
    
    var movies = [Movie]()
    
    func fetchMovies(completition: @escaping ((_ movies: [Movie]) -> Void)) {
        APIManager.shared.getMovies(url: Config.Services.topRated, completition: { (response) in
            self.movies.removeAll() //replace the current array of local movies with the new movies from the server
            for (_,movieJson):(String, JSON) in response[Keys.results] {
                let newMovie = Movie.init(json: movieJson)
                self.movies.append(newMovie)
            }
            completition(self.movies)
        }) { (error) in
            print("Error en la llamada: \(error)")
        }
    }
}
