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
    var preventAnimation = Set<NSIndexPath>()

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
            let color = getColorBySection(section)
            
            var header = HeaderDescription.instanceFromNib()

            header.profileName.text = "Matheus Frozzi Alberton"
            header.profileAge.text = "22 years"
            header.profileImage.image = UIImage(named:"profile-image")
            
            header.profileImage.layer.cornerRadius = header.profileImage.frame.size.width / 2;
            header.profileImage.clipsToBounds = true;
            
            return header
        } else {
            let lifeClass = LifeManager(dictionary: history[section] as! NSDictionary)
            
            let color = getColorBySection(section)

            var header = HeaderTableViewCell.instanceFromNib()

            header.titleCell.text = lifeClass.title
            header.yearCell.text = lifeClass.year
            header.imageCell.image = UIImage(named:lifeClass.imageIcon!)
            header.headerCell.backgroundColor = color
            
            header.layer.opacity = 0.1
            
            UIView.animateWithDuration(1.4,
                delay: 0.0,
                options: UIViewAnimationOptions.AllowUserInteraction,
                animations: {
                    header.layer.opacity = 1
                }, completion: nil
            )

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
        var cell: LifeTableViewCell
        
        var lifeClass = LifeManager(dictionary: history[indexPath.section] as! NSDictionary)

        if(indexPath.section == 0) {
            cell = tableView.dequeueReusableCellWithIdentifier("headerCell") as! LifeTableViewCell
            
            cell.descriptionHeader.text = lifeClass.descriptionLife
        } else {
            cell = tableView.dequeueReusableCellWithIdentifier("lifeCell") as! LifeTableViewCell
            
            let color = getColorBySection(indexPath.section)

            cell.backgroundColor = color
            cell.lineCell.backgroundColor = color
            cell.descriptionLife.text = lifeClass.descriptionLife! + "\n\n" + lifeClass.newSkills!

            if(!lifeClass.newSkills!.isEmpty) {
//                cell.skillsTitle.hidden = false
//                cell.newSkills.hidden = false
//                cell.newSkills.text = lifeClass.newSkills
            } else {
//                cell.skillsTitle.hidden = true
//                cell.newSkills.hidden = true
            }
        }

        return cell
    }

    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        if !preventAnimation.contains(indexPath) {
//            preventAnimation.insert(indexPath)
//            TipInCellAnimator.animate(cell)
            let view = cell.contentView
            view.layer.opacity = 0.1
            
            UIView.animateWithDuration(1.4,
                delay: 0.0,
                options: UIViewAnimationOptions.AllowUserInteraction,
                animations: {
                    view.layer.opacity = 1
                }, completion: nil
            )
        }
    }
    
    func tableView(tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        if(section != 0) {
            let header = view as! HeaderTableViewCell
            header.imageCell.layer.opacity = 0.1
            
            UIView.animateWithDuration(1.4,
                delay: 0.0,
                options: UIViewAnimationOptions.AllowUserInteraction,
                animations: {
                    header.imageCell.layer.opacity = 1
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
        var header = ["Title":"Matheus Frozzi Alberton","Year":"","Description":"Love for development come to computing courses, where I met languages for web that led me to work with web development. Working with HTML languages / CSS for front end and PHP for the back-end.\nI started working with iOS since February 2015, when I had the first contact with the Objective-C language, I started developing some applications in that language, I'm learning Swift also developing an application.\n I am participating in a development program for iOS.", "Icon":"", "newSkills": ""]
        var one = ["Title":"Born","Year":"1992","Description":"Born in the city of Porto Alegre\nRio Grande do Sul\nBrazil", "Icon":"born-icon", "newSkills": ""]
        var two = ["Title":"Start with IT","Year":"2006","Description":"With age 14 start his first IT course, a basic course to students from neighborhood. Learning HTML using frontpage", "Icon":"start_it", "newSkills": "HTML"]
        var three = ["Title":"Meet IT for real","Year":"2009","Description":"Start a technical course to learn full websites using bsic HTML/CSS/PHP and desktop application with Delphi", "Icon":"it_real_90", "newSkills": "CSS\nPHP\nDelphi\nC/C++\nMySQL\nFireworks\nDreamweaver"]
        var four = ["Title":"First Job","Year":"2010","Description":"In mid-year 2010 was joined first job, INVENTA Design, working as web developer(front-end, back-end)", "Icon":"job_1", "newSkills": "CMS\nExperience\nDashboard\nSublimeText\nPayment Gateway"]
        var five = ["Title":"Web Specialization","Year":"2010","Description":"Final objective of the course is make a e-commerce website with all content learned.", "Icon":"web", "newSkills": "OOP\nCSS3\njQuery\nJavaScript"]
        var six = ["Title":"College Time","Year":"2012","Description":"With a bit of knowledge, started the college of Analysis and Systems Development in SENAC a college in Brazil", "Icon":"college", "newSkills": "Java\nPostgreSQL\nGame Thinking\nProject Management\nSoftware Engineering"]
        var seven = ["Title":"Join in Madre","Year":"2014","Description": "Madre is a digital creative house that crafts amazing products, experiences & platforms, in this time in Madre, learn a lot about new features of Front-End an UI/UX, making some fresh e-commerce, web sites one page and dashboards", "Icon":"creative", "newSkills": "UI/UX\nSilex\nAngularJS\nCodeIgniter\nMedia Query\nDesign Thinking"]
        var eight = ["Title":"Finding the Light","Year":"2015","Description":"Some years with web development and in 2015 year change all, starting a course(BEPiD) of only iOS, it's great. In 3 months of course I learned a lot of things, working fine in Objective-C and starting in Swift, this course is changing my life and my way of thinking.", "Icon":"ios", "newSkills": "Swift\nXcode\nParse.com\nObjective-C"]
        var nine = ["Title":"Conclusion","Year":"","Description":"After some years as web developer, with my experiences, make me one iOS developer, and I'm loving it. =)", "Icon":"ios", "newSkills": ""]

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
}
