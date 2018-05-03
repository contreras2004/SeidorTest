//
//  MovieTableViewCell.swift
//  SeidorTest
//
//  Created by Matías Contreras Selman on 02-05-18.
//  Copyright © 2018 Matias Contreras. All rights reserved.
//

import UIKit

protocol MovieTableViewCellDelegate {
    func didPressButton(movie: Movie)
}

class MovieTableViewCell: UITableViewCell {
    
    var delegate : MovieTableViewCellDelegate?
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var desc: UILabel!
    @IBOutlet weak var rating: UILabel!
    
    var movie : Movie?{
        didSet{
            render()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func render() {
        if let movie = self.movie{
            self.title.text     = movie.title
            self.desc.text      = movie.overview
            self.rating.text    =  "\(movie.voteAverage.rounded(toPlaces: 3))"
        }
    }

    @IBAction func buttonPressed(_ sender: Any) {
        //pass the button action to the delegate
        if let delegate = delegate, let movie = self.movie {
            delegate.didPressButton(movie: movie)
        }
    }
}
