//
//  ViewController.swift
//  BeerViewer
//
//  Created by Geovanni Oliveira de Jesus on 18/02/21.
//  Copyright © 2021 Geovanni Oliveira de Jesus. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var network = NetworkManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        network.parseJSON()
    }


}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
}

