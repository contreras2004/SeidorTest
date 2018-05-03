//
//  ContainerDetailViewController.swift
//  SeidorTest
//
//  Created by Matías Contreras Selman on 03-05-18.
//  Copyright © 2018 Matias Contreras. All rights reserved.
//

import UIKit

class ContainerDetailViewController: UIViewController {

    var movie : Movie?
    
    @IBOutlet weak var containerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        render()
    }
    
    func render() {
        containerView.layer.cornerRadius = 10
        containerView.layer.masksToBounds = true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let containerView = segue.destination as? MovieDetailsTableViewController{
            containerView.movie = self.movie
        }
    }

    @IBAction func close(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
