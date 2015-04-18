//
//  ContactTableViewCell.swift
//  MatheusAlberton
//
//  Created by Matheus Frozzi Alberton on 17/04/15.
//  Copyright (c) 2015 BEPiD. All rights reserved.
//

import UIKit

class ContactTableViewCell: UITableViewCell {

    @IBOutlet weak var contactName: UILabel!
    @IBOutlet weak var contactImage: UIImageView!

    @IBOutlet weak var contactIcon: UIImageView!
    @IBOutlet weak var contactUrl: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
