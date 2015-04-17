//
//  LifeTableViewCell.swift
//  MatheusAlberton
//
//  Created by Matheus Frozzi Alberton on 15/04/15.
//  Copyright (c) 2015 BEPiD. All rights reserved.
//

import UIKit

class LifeTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLife: UILabel!
    @IBOutlet weak var descriptionLife: UILabel!
    @IBOutlet weak var yearLife: UILabel!
    @IBOutlet weak var imageLife: UIImageView!
    @IBOutlet weak var newSkills: UILabel!
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var lineCell: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
