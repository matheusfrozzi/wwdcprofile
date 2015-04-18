//
//  HeaderTableViewCell.swift
//  MatheusAlberton
//
//  Created by Matheus Frozzi Alberton on 17/04/15.
//  Copyright (c) 2015 BEPiD. All rights reserved.
//

import UIKit

class HeaderTableViewCell: UIView {
    @IBOutlet weak var titleCell: UILabel!
    @IBOutlet weak var imageCell: UIImageView!
    @IBOutlet weak var yearCell: UILabel!
    @IBOutlet weak var headerCell: UIView!

    
    class func instanceFromNib() -> HeaderTableViewCell {
        return NSBundle.mainBundle().loadNibNamed("sectionHeader", owner: self, options: nil)[0] as! HeaderTableViewCell
    }
    
    
}
