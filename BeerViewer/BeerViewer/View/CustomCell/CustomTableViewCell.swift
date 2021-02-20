//
//  CustomTableViewCell.swift
//  BeerViewer
//
//  Created by Geovanni Oliveira de Jesus on 20/02/21.
//  Copyright © 2021 Geovanni Oliveira de Jesus. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var beerName: UILabel!
    @IBOutlet weak var abv: UILabel!
    @IBOutlet weak var abvContent: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
