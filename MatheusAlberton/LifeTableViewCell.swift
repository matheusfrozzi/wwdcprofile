//
//  LifeTableViewCell.swift
//  MatheusAlberton
//
//  Created by Matheus Frozzi Alberton on 15/04/15.
//  Copyright (c) 2015 BEPiD. All rights reserved.
//

import UIKit

class LifeTableViewCell: UITableViewCell {

    @IBOutlet weak var descriptionLife: UILabel!
    @IBOutlet weak var descriptionHeader: UILabel!
    @IBOutlet weak var labelButton: UILabel!
    @IBOutlet weak var viewButton: UIView!
    @IBOutlet weak var arrowButton: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}