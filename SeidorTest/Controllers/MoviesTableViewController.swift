//
//  MoviesTableViewController.swift
//  SeidorTest
//
//  Created by Matías Contreras Selman on 02-05-18.
//  Copyright © 2018 Matias Contreras. All rights reserved.
//

import UIKit
import SVProgressHUD

class MoviesTableViewController: UITableViewController {

    let cellIdentifier = "movieCellIdentifier"
    let movieDetailsSegue = "showMovieDetails"
    var movies = [Movie]()
    var selectedMovie : Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.titleView = setTitle(title: Strings.moviesTitle, subtitle: Strings.orderedByPopularity)
        self.fetchMovies(order: MovieManager.Order.popularity)
    }

    @IBAction func showOptions(_ sender: Any) {
        let alert = UIAlertController(title: "Ordenar películas por", message: nil, preferredStyle: .actionSheet)
        let ac = UIAlertAction(title: "Más Populares Primero", style: .default) { (action) in
            self.fetchMovies(order: MovieManager.Order.popularity)
        }
        let ac2 = UIAlertAction(title: "Mejores Calificadas Primero", style: .default) { (action) in
            self.fetchMovies(order: MovieManager.Order.topRated)
        }
        let cancel = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        alert.addAction(ac)
        alert.addAction(ac2)
        alert.addAction(cancel)
        self.present(alert, animated: true, completion: nil)
    }
    
    func fetchMovies(order: MovieManager.Order){
        SVProgressHUD.show(withStatus: nil)
        MovieManager.shared.fetchMovies(orderedBy: order) { (movies) in
            self.movies = movies
            switch order{
            case .popularity:
                self.navigationItem.titleView = self.setTitle(title: Strings.moviesTitle, subtitle: Strings.orderedByPopularity)
                break
            case.topRated:
                self.navigationItem.titleView = self.setTitle(title: Strings.moviesTitle, subtitle: Strings.orderedByTopRated)
                break
            }
            self.tableView.reloadData()
            SVProgressHUD.dismiss()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func setTitle(title:String, subtitle:String) -> UIView {
        let titleLabel = UILabel(frame: CGRect(x:0, y:-5, width:0, height:0))
        
        titleLabel.backgroundColor = UIColor.clear
        titleLabel.textColor = UIColor.darkText
        titleLabel.font = UIFont.boldSystemFont(ofSize: 17)
        titleLabel.text = title
        titleLabel.sizeToFit()
        
        let subtitleLabel = UILabel(frame: CGRect(x:0, y:18, width:0, height:0))
        subtitleLabel.backgroundColor = UIColor.clear
        subtitleLabel.textColor = UIColor.gray
        subtitleLabel.font = UIFont.systemFont(ofSize: 12)
        subtitleLabel.text = subtitle
        subtitleLabel.sizeToFit()
        
        let titleView = UIView(frame: CGRect(x:0, y:0, width:max(titleLabel.frame.size.width, subtitleLabel.frame.size.width), height:30))
        titleView.addSubview(titleLabel)
        titleView.addSubview(subtitleLabel)
        
        let widthDiff = subtitleLabel.frame.size.width - titleLabel.frame.size.width
        
        if widthDiff > 0 {
            var frame = titleLabel.frame
            frame.origin.x = widthDiff / 2
            titleLabel.frame = frame.integral
        } else {
            var frame = subtitleLabel.frame
            frame.origin.x = abs(widthDiff) / 2
            titleLabel.frame = frame.integral
        }
        
        return titleView
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! MovieTableViewCell
        cell.delegate = self //asign the delegate so we can detect the click action on each button
        cell.movie = movies[indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }

}

extension MoviesTableViewController: MovieTableViewCellDelegate{
    func didPressButton(movie: Movie) {
        self.selectedMovie = movie
        self.performSegue(withIdentifier: movieDetailsSegue, sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let containerDetailViewController = segue.destination as? ContainerDetailViewController{
            containerDetailViewController.movie = self.selectedMovie
        }
    }
}
