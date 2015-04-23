//
//  WhoViewController.swift
//  MatheusAlberton
//
//  Created by Matheus Frozzi Alberton on 15/04/15.
//  Copyright (c) 2015 BEPiD. All rights reserved.
//

import UIKit

class WhoViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!

    var history = []

    override func viewDidLoad() {
        super.viewDidLoad()

        insertData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBarHidden = true;
    }

    func updateTableView() {
        self.tableView.reloadData()
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return history.count
    }

    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?{
        if(section == 0) {
            var header = HeaderDescription.instanceFromNib()
            
            return header
        } else {
            let lifeClass = LifeManager(dictionary: history[section] as! NSDictionary)
            
            let color = getColorBySection(section)

            var header = HeaderTableViewCell.instanceFromNib()

            header.titleCell.text = lifeClass.title
            header.yearCell.text = lifeClass.year
            header.imageCell.image = UIImage(named:lifeClass.imageIcon!)
            header.headerCell.backgroundColor = color

            return header
        }
    }

    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if(section == 0) {
            return 150
        } else {
            return 100
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("lifeCell") as! LifeTableViewCell
        
        var lifeClass = LifeManager(dictionary: history[indexPath.section] as! NSDictionary)

        if(indexPath.section == 0) {
            buttonScrollDown(cell)
            cell.descriptionLife.textColor = UIColor(red: 51.0/255.0, green: 51.0/255.0, blue: 51.0/255.0, alpha: 1.0)
        } else {
            cell.arrowDown.hidden = true
            cell.descriptionLife.textColor = UIColor.whiteColor()
        }
        
        var skillstext: String?

        if(!lifeClass.newSkills!.isEmpty) {
            skillstext = "Skills Learned:\n"
        } else {
            skillstext = ""
        }

        cell.descriptionLife.text = lifeClass.descriptionLife! + "\n\n" + skillstext! + lifeClass.newSkills!

        let color = getColorBySection(indexPath.section)
        cell.backgroundColor = color

        if(indexPath.section == 1) {
            showButton(cell, Show: true, buttonName: "About me")
        } else if(indexPath.section == 8) {
            showButton(cell, Show: true, buttonName: "My apps")
        } else {
            showButton(cell, Show: false, buttonName: "")
        }

        return cell
    }

    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        let view = cell.contentView

        view.layer.opacity = 0.1
        
        UIView.animateWithDuration(1.5,
            delay: 0.0,
            options: UIViewAnimationOptions.AllowUserInteraction,
            animations: {
                view.layer.opacity = 1
            }, completion: nil
        )
    }
    
    func tableView(tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        if(section != 0) {
            let header = view as! HeaderTableViewCell

            header.imageCell.layer.opacity = 0.1
            header.titleCell.layer.opacity = 0.1
            header.yearCell.layer.opacity = 0.1

            UIView.animateWithDuration(0.8,
                delay: 0.0,
                options: UIViewAnimationOptions.AllowUserInteraction,
                animations: {
                    header.imageCell.layer.opacity = 1
                    header.titleCell.layer.opacity = 1
                    header.yearCell.layer.opacity = 1
                    header.imageCell.transform = CGAffineTransformMakeTranslation(0, 20)
                    header.titleCell.transform = CGAffineTransformMakeTranslation(80, 0)
                    header.yearCell.transform = CGAffineTransformMakeTranslation(-80, 0)
                }, completion: nil
            )
        } else {
            let header = view as! HeaderDescription

            header.profileImage.layer.opacity = 0.1
            header.profileName.layer.opacity = 0.1
            header.profileAge.layer.opacity = 0.1
            
            UIView.animateWithDuration(0.8,
                delay: 0.0,
                options: UIViewAnimationOptions.AllowUserInteraction,
                animations: {
                    header.profileImage.layer.opacity = 1
                    header.profileName.layer.opacity = 1
                    header.profileAge.layer.opacity = 1
                    header.profileImage.transform = CGAffineTransformMakeTranslation(0, 20)
                    header.profileName.transform = CGAffineTransformMakeTranslation(80, 0)
                    header.profileAge.transform = CGAffineTransformMakeTranslation(-80, 0)
                }, completion: nil
            )
        }
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if(indexPath.section == 1) {
            self.performSegueWithIdentifier("contactSegue", sender: self)
        } else if(indexPath.section == 8) {
            self.performSegueWithIdentifier("myApps", sender: self)
        }
    }

    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if(indexPath.section == 0) {
            return self.view.frame.size.height-150
        } else {
            return self.view.frame.size.height-100
        }
    }

    func insertData() {
        var header = ["Title":"Matheus Frozzi Alberton","Year":"","Description":"I've started with web development, working and studying with HTML/CSS/JavaScript/PHP and was love at first sight. In this year, I've started to work with iOS development, where I had the first contact with Objective-C and Swift.", "Icon":"profile-draw", "newSkills": ""]
        var one = ["Title":"Born","Year":"1992","Description":"Porto Alegre\nRio Grande do Sul\nBrazil", "Icon":"born-icon", "newSkills": ""]
        var two = ["Title":"Hello World","Year":"2006","Description":"With 14 years old, I had my first contact with technology, learning the basics about front-end.", "Icon":"start_it", "newSkills": "HTML"]
        var three = ["Title":"Learning Development","Year":"2009","Description":"In this year, I've started a technical course where I learn more about programming with C/C++. As a final challenge, I've developed a totaly dynamic website using PHP and a CRM using Delphi, both using MySQL as database.", "Icon":"it_real_90", "newSkills": "CSS\nPHP\nDelphi\nC/C++\nMySQL\nFireworks\nDreamweaver"]
        var four = ["Title":"First Job","Year":"2010","Description":"In the 2010 I was hired by a small company in my hometown, where I've worked with front-end and back-end development for 4 years.", "Icon":"job_1", "newSkills": "CMS\nExperience\nDashboard\nSublimeText\nPayment Gateway"]
        var five = ["Title":"Web Specialization","Year":"2010","Description":"Learned the best practices of web development, using Object-oriented programming concepts with PHP. As a final challenge, I've developed an e-commerce.", "Icon":"web", "newSkills": "OOP\nCSS3\njQuery\nJavaScript"]
        var six = ["Title":"College","Year":"2012","Description":"I joined college to study Analysis and Systems Development to improve myself. Learned a lot about Java and some important concepts such as agile development, software engineering and project management.", "Icon":"college", "newSkills": "Java\nPostgreSQL\nGame Thinking\nProject Management\nSoftware Engineering"]
        var seven = ["Title":"Current Job","Year":"2014","Description": "In 2014 I was hired by Madre Crossmedia, a digital agency who is focused in UI/UX. There, I'm working with web development, developing responsive websites and e-commerces. Also, I'm doing some experiences with iOS development.", "Icon":"creative", "newSkills": "UI/UX\nSilex\nAngularJS\nCodeIgniter\nMedia Query\nDesign Thinking"]
        var eight = ["Title":"iOS\nDevelopment","Year":"2015","Description":"I joined BEPiD (Brazilian Education Program for iOS Development) where I'm working just with iOS (Swift and Objective-C). Current studying and very interested about this universe.", "Icon":"ios", "newSkills": "Swift\nXcode\nParse.com\nObjective-C"]
        var nine = ["Title":"Conclusion","Year":"","Description":"I always loved development. As I said before, it was love at first sight. Web development is something that I liked, but now I'm focused to develop amazing apps, and after three months on BEPiD, I already published one app in the AppStore and other two apps are under development. Also, I'm here, sending another app to prove my interest in this universe where I want to learn more about it.", "Icon":"conclusion", "newSkills": ""]

        history = [header, one, two, three, four, five, six, seven, eight, nine]
    }

    func getColorBySection(section: Int) -> UIColor {
        var color: UIColor?

        if(section == 0){
            color = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 1.0)
        } else if(section == 1) {
            color = UIColor(red: 255.0/255.0, green: 110.0/255.0, blue: 221.0/255.0, alpha: 1.0)
        } else if(section == 2) {
            color = UIColor(red: 255.0/255.0, green: 85.0/255.0, blue: 96.0/255.0, alpha: 1.0)
        }else if(section == 3) {
            color = UIColor(red: 255.0/255.0, green: 133.0/255.0, blue: 79.0/255.0, alpha: 1.0)
        }else if(section == 4) {
            color = UIColor(red: 255.0/255.0, green: 193.0/255.0, blue: 38.0/255.0, alpha: 1.0)
        }else if(section == 5) {
            color = UIColor(red: 48.0/255.0, green: 226.0/255.0, blue: 208.0/255.0, alpha: 1.0)
        }else if(section == 6) {
            color = UIColor(red: 4.0/255.0, green: 106.0/255.0, blue: 255.0/255.0, alpha: 1.0)
        }else if(section == 7) {
            color = UIColor(red: 149.0/255.0, green: 23.0/255.0, blue: 255.0/255.0, alpha: 1.0)
        }else if(section == 8) {
            color = UIColor(red: 221.0/255.0, green: 47.0/255.0, blue: 247.0/255.0, alpha: 1.0)
        } else if(section == 9) {
            color = UIColor(red: 31.0/255.0, green: 2.0/255.0, blue: 68.0/255.0, alpha: 1.0)
        }

        return color!
    }
    
    func showButton(cell: LifeTableViewCell, Show: Bool, buttonName: String) {
        cell.viewButton.layer.cornerRadius = 6;
        cell.viewButton.clipsToBounds = true;
        let bordercolor = UIColor.whiteColor()
        cell.viewButton.layer.borderColor = bordercolor.CGColor
        cell.viewButton.layer.borderWidth = 1.7

        cell.labelButton.text = buttonName

        if(Show == true) {
            cell.viewButton.hidden = false
            cell.labelButton.hidden = false
        } else {
            cell.viewButton.hidden = true
            cell.labelButton.hidden = true
        }
    }

    func buttonScrollDown (cell: LifeTableViewCell) {
        cell.arrowDown.hidden = false
        let options = UIViewAnimationOptions.Autoreverse | UIViewAnimationOptions.Repeat | UIViewAnimationOptions.CurveEaseInOut
        
        UIView.animateWithDuration(1.0, delay: 0.0, options: options, animations: {
            cell.arrowDown.transform = CGAffineTransformMakeTranslation(0, 16)
        }, completion: nil)
    }
}
