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
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "CustomTableViewCell", bundle: .main), forCellReuseIdentifier: "cell")
        network.parseJSON()
    }


}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return network.response.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? CustomTableViewCell else { return UITableViewCell() }
        
        cell.beerName.text = network.response[indexPath.row].name
        cell.abvContent.text = String(describing: network.response[indexPath.row].abv)

        
        return cell
    }
    
    
}

