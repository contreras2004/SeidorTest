//
//  MovieDetailsTableViewController.swift
//  SeidorTest
//
//  Created by Matías Contreras Selman on 03-05-18.
//  Copyright © 2018 Matias Contreras. All rights reserved.
//

import UIKit
import SDWebImage

class MovieDetailsTableViewController: UITableViewController {

    var movie : Movie?
    
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    
    @IBOutlet weak var movieOriginalTitle: UILabel!
    @IBOutlet weak var movieReleaseDate: UILabel!
    @IBOutlet weak var movieLanguage: UILabel!
    
    @IBOutlet weak var movieOverview: UILabel!
    @IBOutlet weak var movieVote: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.tableFooterView = UIView()
        tableView.rowHeight = UITableViewAutomaticDimension
        
        render()
        
    }
    
    func render(){
        if let movie = movie{
            print(movie.posterPath)
            self.movieTitle.text = movie.title
            self.movieOriginalTitle.text = movie.originalTitle
            self.movieReleaseDate.text = movie.releaseDate
            self.movieLanguage.text = getFullLanguageName(movie: movie)
            self.movieImage.sd_setImage(with: URL(string: movie.posterPath), placeholderImage: UIImage(named: "placeholder.png"))
            self.movieOverview.text = movie.overview
            self.movieVote.text = "\(movie.voteAverage.rounded(toPlaces: 3))"
        }
        
    }

    func getFullLanguageName(movie: Movie) -> String{
        let locale = NSLocale(localeIdentifier: "en_US")
        return locale.displayName(forKey: NSLocale.Key.identifier, value: movie.originalLanguage)!
    }
}
