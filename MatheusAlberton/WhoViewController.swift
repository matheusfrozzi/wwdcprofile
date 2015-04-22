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
            showButton(cell, Show: true, buttonName: "See more about me")
        } else if(indexPath.section == 8) {
            showButton(cell, Show: true, buttonName: "See my Apps")
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
        if(indexPath.section == 0 || indexPath.section == 1) {
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
        var header = ["Title":"Matheus Frozzi Alberton","Year":"","Description":"Love for development come in IT courses, where I met languages for web like HTML/CSS/PHP where I started my life in development.\nI started working with iOS since February 2015, when I had the first contact with the Objective-C and Swift.", "Icon":"profile-draw", "newSkills": ""]
        var one = ["Title":"Born","Year":"1992","Description":"Born in:\nPorto Alegre\nRio Grande do Sul\nBrazil", "Icon":"born-icon", "newSkills": ""]
        var two = ["Title":"Knowing Computer","Year":"2006","Description":"With age 14 start his first IT course, a basic course to students from neighborhood. Learning HTML using frontpage.", "Icon":"start_it", "newSkills": "HTML"]
        var three = ["Title":"Learning development","Year":"2009","Description":"Computer technician course that taught the basic concepts of programming with C and C ++, and assembly of computers, and to finish the course needed to make a dynamic site and an application in Delphi using MySQL.", "Icon":"it_real_90", "newSkills": "CSS\nPHP\nDelphi\nC/C++\nMySQL\nFireworks\nDreamweaver"]
        var four = ["Title":"First Job","Year":"2010","Description":"In the middle 2010 got my first job, where worked as the only web developer of the company, as Front End and Back-End, worked in that company until early 2014.", "Icon":"job_1", "newSkills": "CMS\nExperience\nDashboard\nSublimeText\nPayment Gateway"]
        var five = ["Title":"Web Specialization","Year":"2010","Description":"Course Teaches best practices for web development, using OO programming with PHP. Objective final of the course was to create a e-commerce.", "Icon":"web", "newSkills": "OOP\nCSS3\njQuery\nJavaScript"]
        var six = ["Title":"College","Year":"2012","Description":"I am attending college to analysis and systems development to improve myself, where I learned a lot and applying in my projects.", "Icon":"college", "newSkills": "Java\nPostgreSQL\nGame Thinking\nProject Management\nSoftware Engineering"]
        var seven = ["Title":"Join in Madre","Year":"2014","Description": "Madre is a digital creative house that crafts amazing products, experiences & platforms, in this time in Madre, learn a lot about new features of Front-End and UI/UX, making some cool e-commerce, one page sites and dashboards", "Icon":"creative", "newSkills": "UI/UX\nSilex\nAngularJS\nCodeIgniter\nMedia Query\nDesign Thinking"]
        var eight = ["Title":"Working with iOS","Year":"2015","Description":"I started a course focused on developing applications for iOS called BEPiD, in this course I learned a lot about development, creativity, Objective-C and Swift.", "Icon":"ios", "newSkills": "Swift\nXcode\nParse.com\nObjective-C"]
        var nine = ["Title":"Conclusion","Year":"","Description":"Always loved development, making cool sites is something that I liked, now I have the opportunity to develop Apps, and after 3 months of learning iOS already published 1 App in the AppStore and 2 as Beta Test and more some ideas is in development, and I think my love of developing this causing my fast learning. =)", "Icon":"conclusion", "newSkills": ""]

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
