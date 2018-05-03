//
//  MoviesTableViewController.swift
//  SeidorTest
//
//  Created by Matías Contreras Selman on 02-05-18.
//  Copyright © 2018 Matias Contreras. All rights reserved.
//

import UIKit

class MoviesTableViewController: UITableViewController {

    let cellIdentifier = "movieCellIdentifier"
    var movies = [Movie]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        MovieManager.shared.fetchMovies { (movies) in
            self.movies = movies
            self.tableView.reloadData()
        }
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! MovieTableViewCell
        cell.movie = movies[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }

}
