//
//  ContactViewController.swift
//  MatheusAlberton
//
//  Created by Matheus Frozzi Alberton on 15/04/15.
//  Copyright (c) 2015 BEPiD. All rights reserved.
//

import UIKit

class ContactViewController: UIViewController {

    var contacts = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        insertData()
    }
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBarHidden = false;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }

    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Contact Me"
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell: ContactTableViewCell

        let contactClass = ContactManager(dictionary: contacts[indexPath.row] as! NSDictionary)

        if(indexPath.row == 0) {
            cell = tableView.dequeueReusableCellWithIdentifier("cellTop") as! ContactTableViewCell
            
            cell.contactName.text = contactClass.nameContact
            cell.contactImage.image = UIImage(named:contactClass.imageIcon!)
            
            cell.contactImage.layer.cornerRadius = cell.contactImage.frame.size.width / 2;
            cell.contactImage.clipsToBounds = true;
        } else {
            cell = tableView.dequeueReusableCellWithIdentifier("cellContacts") as! ContactTableViewCell
            
            cell.contactUrl.text = contactClass.nameContact
            cell.contactIcon.image = UIImage(named:contactClass.imageIcon!)
        }

        return cell
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if(indexPath.row == 0) {
            return 120
        } else {
            return 55
        }
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let contactClass = ContactManager(dictionary: contacts[indexPath.row] as! NSDictionary)

        UIApplication.sharedApplication().openURL(NSURL(string: contactClass.urlContact!)!)
//        UIApplication.sharedApplication().openURL(NSURL(string: "tel://9809088798"))
//        let url = NSURL(string: "mailto:\(contactClass.urlContact)")
//        UIApplication.sharedApplication().openURL(url)
    }

    func insertData() {
        var one = ["Icon":"profile-image","Name":"Matheus Frozzi Alberton", "Url":""]
        var fb = ["Icon":"fb-icon","Name":"/matheusgringo", "Url":"http://fb.com/matheusgringo"]
        var twitter = ["Icon":"twitter-icon","Name":"/matheus_gringo", "Url":"https://twitter.com/matheus_gringo"]
        var linkedin = ["Icon":"linkedin-icon","Name":"/matheusfrozzi", "Url":"https://br.linkedin.com/in/matheusfrozzi"]
        var instagram = ["Icon":"instagram-icon","Name":"/matheusgringo", "Url":"http://instagram.com/matheusgringo"]
        var mail = ["Icon":"mail-icon","Name":"matheusfrozzi@gmail.com", "Url":"matheusfrozzi@gmail.com"]
        var phone = ["Icon":"phone-icon","Name":"+55 51 81745271", "Url":"+55 51 81745271"]
        var github = ["Icon":"github-icon","Name":"/matheusfrozzi", "Url":"https://github.com/matheusfrozzi"]
        var bitbucket = ["Icon":"bitbucket-icon","Name":"/matheusfrozzi", "Url":"https://bitbucket.org/matheusfrozzi/"]

        contacts = [one, mail, phone, linkedin, github, bitbucket, instagram, fb, twitter]
    }
}