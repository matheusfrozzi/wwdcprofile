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
    @IBOutlet weak var skillsTitle: UILabel!
    @IBOutlet weak var newSkills: UILabel!
    @IBOutlet weak var lineCell: UIView!
    @IBOutlet weak var descriptionHeader: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}