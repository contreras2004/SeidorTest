//
//  Config.swift
//  SeidorTest
//
//  Created by Matías Contreras Selman on 02-05-18.
//  Copyright © 2018 Matias Contreras. All rights reserved.
//

import UIKit

class Config{
    
    private static let apiKey       = "34738023d27013e6d1b995443764da44a"
    private static let baseDomain   = "https://api.themoviedb.org"
    
    private struct Endpoints{
        static let movies         = "/3/movie/%@?api_key=%@"
    }
    
    public class func moviesUrl(order: MovieManager.Order) -> String{
        return "\(Config.baseDomain)\(String(format: Config.Endpoints.movies, order.rawValue, Config.apiKey))";
    }
}



