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
    
    var beerViewModel: BeerViewModelProtocol?
    var beers: [BeerModel] = [BeerModel]()
    var pageToRequest = 1
    let beersPerPage = 10
    let offsetToRequest = 5
    let cellIdentifier: String = "cell"
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setTableView()
        beerViewModel = BeerViewModel()
        
        beerViewModel?.getData(page: pageToRequest,
                               perPage: beersPerPage, completionHandler: { (status, responseData) in
                                if let data = responseData {
                                    self.beers = data
                                    self.tableView.reloadData()
                                } else {
                                    print("ERROR")
                                }
                                
        })
    }


    private func setTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "CustomTableViewCell",
                                 bundle: .main),
                           forCellReuseIdentifier: cellIdentifier)
    }
    
    func presentDetailView(beerIndex: Int) {
        let nib = UINib(nibName: "DetailViewController", bundle:nil)
        let detailViewController = nib.instantiate(withOwner: self, options: nil)[0] as? DetailViewController

        detailViewController?.beer = beers[beerIndex]
        detailViewController?.viewDidLoad()
        self.present((detailViewController)!, animated: true, completion: nil)
   }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.beers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? CustomTableViewCell else { return UITableViewCell() }
        
        if let imgData = self.beers[indexPath.row].imgData {
            cell.imgView.image = UIImage(data: imgData)
        }
        cell.beerName.text = self.beers[indexPath.row].name
        cell.abvContent.text = String(describing: self.beers[indexPath.row].abv!)

        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView.deselectRow(at: indexPath, animated: true)
        presentDetailView(beerIndex: indexPath.row)
        
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        if indexPath.row == self.beers.count - offsetToRequest {
            pageToRequest += 1
            beerViewModel?.getData(page: pageToRequest,
                                   perPage: beersPerPage, completionHandler: { (status, responseData) in
                                    if status == .success {
                                        if let data = responseData {
                                            self.beers.append(contentsOf: data)
                                            self.tableView.reloadData()
                                        } else {
                                            print("ERROR")
                                        }
                                    }
            })
        }
    }
    
}

