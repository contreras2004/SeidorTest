//
//  Config.swift
//  SeidorTest
//
//  Created by Matías Contreras Selman on 02-05-18.
//  Copyright © 2018 Matias Contreras. All rights reserved.
//

import UIKit

class Config{
    
    private static let apiKey       = "34738023d27013e6d1b995443764da44"
    private static let baseDomain   = "https://api.themoviedb.org"
    
    private struct Endpoints{
        static let topRated         = "/3/movie/top_rated?api_key=%@"
        static let popular          = "/3/movie/popular?api_key=%@"
    }
    
    public struct Services {
        static var topRated: String {
            get {
                return "\(Config.baseDomain)\(String(format: Config.Endpoints.topRated, Config.apiKey))";
            }
        }
        static var popular: String {
            get {
                return "\(Config.baseDomain)\(String(format: Config.Endpoints.popular, Config.apiKey))";
            }
        }
    }
    
}



