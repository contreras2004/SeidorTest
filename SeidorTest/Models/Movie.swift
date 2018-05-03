//
//  Movie.swift
//  SeidorTest
//
//  Created by Matías Contreras Selman on 02-05-18.
//  Copyright © 2018 Matias Contreras. All rights reserved.
//

import Foundation
import SwiftyJSON

class Movie{
    
    private let posterPathBase = "http://image.tmdb.org/t/p/w500"
    
    struct Keys{
        static let id = "id"
        static let posterPath = "poster_path"
        static let backdropPath = "backdrop_path"
        //static let genreIds = "genre_ids" we will omit this property for the sake of this example ...
        static let voteCount = "vote_count"
        static let overview = "overview"
        static let originalTitle = "original_title"
        static let voteAverage = "vote_average"
        static let popularity = "popularity"
        static let originalLanguage = "original_language"
        static let releaseDate = "release_date"
        static let video = "video"
        static let title = "title"
        static let adult = "adult"
    }
    
    var id = 0
    var posterPath = ""
    var backdropPath = ""
    var voteCount = ""
    var overview = ""
    var originalTitle = ""
    var voteAverage = 0.0
    var popularity = 0.0
    var originalLanguage = ""
    var releaseDate = ""
    var video = ""
    var title = ""
    var adult = false
    
    init(json: JSON){
        id                  = json[Keys.id].intValue
        posterPath          = "\(posterPathBase)\(json[Keys.posterPath].stringValue)"
        backdropPath        = json[Keys.backdropPath].stringValue
        voteCount           = json[Keys.voteCount].stringValue
        overview            = json[Keys.overview].stringValue
        originalTitle       = json[Keys.originalTitle].stringValue
        voteAverage         = json[Keys.voteAverage].doubleValue
        popularity          = json[Keys.popularity].doubleValue
        originalLanguage    = json[Keys.originalLanguage].stringValue
        releaseDate         = json[Keys.releaseDate].stringValue
        video               = json[Keys.video].stringValue
        title               = json[Keys.title].stringValue
        adult               = json[Keys.adult].boolValue
    }
}
