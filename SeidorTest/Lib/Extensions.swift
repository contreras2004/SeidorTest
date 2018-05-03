//
//  Extensions.swift
//  SeidorTest
//
//  Created by Matías Contreras Selman on 03-05-18.
//  Copyright © 2018 Matias Contreras. All rights reserved.
//

import Foundation

extension Double {
    /// Rounds the double to decimal places value
    func rounded(toPlaces places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}
