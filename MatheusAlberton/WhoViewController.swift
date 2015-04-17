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
        let color = UIColor(red: 63.0/255.0, green: 82.0/255.0, blue: 199.0/255.0, alpha: 1.0)
        UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName: color], forState:.Selected)
        UITabBar.appearance().tintColor = color
    }

    func updateTableView() {
        self.tableView.reloadData()
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return history.count
    }
    func tableView(tableView: UITableView, numberOfSectionsInTableView section: Int) -> Int {
        return 1
    }

//    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?{
    //    var view = UIView() // The width will be the same as the cell, and the height should be set in tableView:heightForRowAtIndexPath:
    //    var label = UILabel()
    //    label.text="My Details"
    //    let button   = UIButton.buttonWithType(UIButtonType.System) as UIButton
    //    button.addTarget(self, action: "visibleRow:", forControlEvents:.TouchUpInside)
    //    label.setTranslatesAutoresizingMaskIntoConstraints(false)
    //    button.setTranslatesAutoresizingMaskIntoConstraints(false)
    //    button.setTitle("Test Title", forState: .Normal)
    //    let views = ["label": label,"button":button,"view": view]
    //    view.addSubview(label)
    //    view.addSubview(button)
    //    var horizontallayoutContraints = NSLayoutConstraint.constraintsWithVisualFormat("H:|-10-[label]-60-[button]-10-|", options: .AlignAllCenterY, metrics: nil, views: views)
    //    view.addConstraints(horizontallayoutContraints)
    //    
    //    var verticalLayoutContraint = NSLayoutConstraint(item: label, attribute: .CenterY, relatedBy: .Equal, toItem: view, attribute: .CenterY, multiplier: 1, constant: 0)
    //    view.addConstraint(verticalLayoutContraint)
    //    return view
//        return nil
//    }
//
//    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 50
//    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("lifeCell") as! LifeTableViewCell
        
        let lifeClass = LifeManager(dictionary: history[indexPath.row] as! NSDictionary)
        
        var color: UIColor?

        if(indexPath.row == 0) {
            color = UIColor(red: 255.0/255.0, green: 110.0/255.0, blue: 221.0/255.0, alpha: 1.0)
        } else if(indexPath.row == 1) {
            color = UIColor(red: 255.0/255.0, green: 85.0/255.0, blue: 96.0/255.0, alpha: 1.0)
        }else if(indexPath.row == 2) {
            color = UIColor(red: 255.0/255.0, green: 133.0/255.0, blue: 79.0/255.0, alpha: 1.0)
        }else if(indexPath.row == 3) {
            color = UIColor(red: 255.0/255.0, green: 193.0/255.0, blue: 38.0/255.0, alpha: 1.0)
        }else if(indexPath.row == 4) {
            color = UIColor(red: 48.0/255.0, green: 226.0/255.0, blue: 208.0/255.0, alpha: 1.0)
        }else if(indexPath.row == 5) {
            color = UIColor(red: 4.0/255.0, green: 106.0/255.0, blue: 255.0/255.0, alpha: 1.0)
        }else if(indexPath.row == 6) {
            color = UIColor(red: 149.0/255.0, green: 23.0/255.0, blue: 255.0/255.0, alpha: 1.0)
        }else if(indexPath.row == 7) {
            color = UIColor(red: 221.0/255.0, green: 47.0/255.0, blue: 247.0/255.0, alpha: 1.0)
        }

        cell.headerView.backgroundColor = color
        cell.lineCell.backgroundColor = color

        cell.yearLife.text = lifeClass.year
        cell.titleLife.text = lifeClass.title
        cell.descriptionLife.text = lifeClass.descriptionLife
        cell.imageLife.image = UIImage(named:lifeClass.imageIcon!)
        cell.newSkills.text = lifeClass.newSkills

        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        println("click")
        if(indexPath.row == 7) {
            self.performSegueWithIdentifier("myApps", sender: self)
        }
    }

    func insertData() {
        var one = ["Title":"Born","Year":"1992","Description":"Born in Brazil, in the city of Porto Alegre Rio Grande do Sul", "Icon":"born-icon", "newSkills": "Cry +"]
        var two = ["Title":"start with IT","Year":"2006","Description":"With age 14 start his first IT course, a basic course to students from neighborhood. Learning HTML using frontpage", "Icon":"start_it", "newSkills": "HTML +"]
        var three = ["Title":"Meet IT for real","Year":"2009","Description":"Start a technical course to learn full websites using bsic HTML/CSS/PHP and desktop application with Delphi", "Icon":"it_real_90", "newSkills": "CSS +\nPHP +\nDelphi +\nC++/C +\nMySQL +\nFireworks +\nDreamweaver +"]
        var four = ["Title":"First Job","Year":"2010","Description":"In mid-year 2010 was joined first job, INVENTA Design, working as web developer(front-end, back-end)", "Icon":"job_1", "newSkills": "CMS +\nDashboard +\nExperience +\nPayment Gateway +\nSublimeText +"]
        var five = ["Title":"Web Specialization","Year":"2010","Description":"Final objective of the course is make a e-commerce website with all content learned.", "Icon":"web", "newSkills": "CSS3 +\nJavaScript +\njQuery +\nOOP +"]
        var six = ["Title":"The college time","Year":"2012","Description":"With a bit of knowledge, started the college of Analysis and Systems Development in SENAC a college in Brazil", "Icon":"college", "newSkills": "Project Management +\nSoftware Engineering +\nJava+\nPostgreSQL +\nGame Thinking +"]
        var seven = ["Title":"Join in Madre","Year":"2014","Description": "Madre is a digital creative house that crafts amazing products, experiences & platforms, in this time in Madre, learn a lot about new features of Front-End an UI/UX, making some fresh e-commerce, web sites one page and dashboards", "Icon":"creative", "newSkills": "Design Thinking +\nUI/UX +\nMedia Query +\nSilex +\nCodeIgniter +\nAngularJS +"]
        var eight = ["Title":"Finding the light","Year":"2015","Description":"Some years with web development and in 2015 year change all, starting a course(BEPiD) of only iOS, it's great. In 3 months of course I learned a lot of things, working fine in Objective-C and starting in Swift, this course is changing my life and my way of thinking.", "Icon":"ios", "newSkills": "Objective-C +\nXcode +\nSwift +\nParse.com +\n"]

        history = [one, two, three, four, five, six, seven, eight]
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
