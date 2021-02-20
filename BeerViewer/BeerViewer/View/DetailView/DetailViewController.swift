//
//  DetailViewController.swift
//  BeerViewer
//
//  Created by Geovanni Oliveira de Jesus on 20/02/21.
//  Copyright © 2021 Geovanni Oliveira de Jesus. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var tagLineContent: UILabel!
    @IBOutlet weak var alcoholicRate: UILabel!
    @IBOutlet weak var bitterRate: UILabel!
    @IBOutlet weak var beerDescription: UILabel!
    
    var beer: BeerModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setBeerData()
    }
    
    func setBeerData() {
        self.titleLbl.text = beer?.name
        if let data = beer?.imgData {
            self.imgView.image = UIImage(data: data)
        }
        self.tagLineContent.text = beer?.tagline
        self.alcoholicRate.text = String(describing: beer?.abv ?? Float())
        self.bitterRate.text = String(describing: beer?.ibu ?? Float())
        self.beerDescription.text = beer?.description
    }

}
