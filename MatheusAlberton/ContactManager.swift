//
//  ContactManager.swift
//  MatheusAlberton
//
//  Created by Matheus Frozzi Alberton on 17/04/15.
//  Copyright (c) 2015 BEPiD. All rights reserved.
//

import UIKit

class ContactManager: NSObject {
    var imageIcon: String?
    var urlContact: String?
    var nameContact: String?
    
    init(dictionary : NSDictionary) {
        super.init()

        self.imageIcon = dictionary.valueForKey("Icon") as? String
        self.nameContact = dictionary.valueForKey("Name") as? String
        self.urlContact = dictionary.valueForKey("Url") as? String
    }
}
