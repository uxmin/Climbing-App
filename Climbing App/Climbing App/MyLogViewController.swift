//
//  MyLogViewController.swift
//  Climbing App
//
//  Created by Min Hu on 6/12/15.
//  Copyright (c) 2015 Min Hu. All rights reserved.
//

import UIKit

class MyLogViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

	@IBOutlet weak var scrollView: UIScrollView!
	@IBOutlet weak var graphView: UIView!
	@IBOutlet weak var logTableView: UITableView!
	
//	var logs = [
//	["level": "5.10a", "location": "Castle Rock", "date": "June 14"],
//	["level": "5.10b", "location": "Castle Rock", "date": "June 14"],
//	["level": "5.11a", "location": "Castle Rock", "date": "June 14"],
//	["level": "V3", "location": "Castle Rock", "date": "June 14"],
//	["level": "V4", "location": "Castle Rock", "date": "June 14"],
//	["level": "5.10d", "location": "Castle Rock", "date": "June 14"],
//	["level": "5.10c", "location": "Castle Rock", "date": "June 14"],
//	["level": "5.11a", "location": "Castle Rock", "date": "June 14"],
//	["level": "5.10a", "location": "Castle Rock", "date": "June 14"],
//	["level": "V4", "location": "Castle Rock", "date": "June 14"],
//	["level": "V3", "location": "Castle Rock", "date": "June 14"],
//	["level": "5.9", "location": "Castle Rock", "date": "June 14"],
//	["level": "5.10a", "location": "Castle Rock", "date": "June 14"],
//	["level": "5.10c", "location": "Castle Rock", "date": "June 14"],
//	["level": "5.10d", "location": "Castle Rock", "date": "June 14"],
//	["level": "5.10b", "location": "Castle Rock", "date": "June 14"],
//	["level": "5.12a", "location": "Castle Rock", "date": "June 14"],
//	["level": "5.10c", "location": "Castle Rock", "date": "June 14"],
//	["level": "V5", "location": "Castle Rock", "date": "June 14"],
//	["level": "V4", "location": "Castle Rock", "date": "June 14"],
//	]
	
	var levels = ["5.10a", "5.10b", "5.11a", "V3", "V4", "5.10d", "5.10c", "5.11a", "V4", "V3", "5.9", "5.10a", "5.10c", "5.10d", "5.10b", "5.12a", "5.10c", "V5", "V4", "5.9"]
	
	var locations = ["Castle Rock", "Castle Rock", "Castle Rock", "Yosemite", "Yosemite", "Yosemite", "Yosemite", "Mt Diablo", "Mt Diablo", "Mt Diablo", "Mt Diablo", "Castle Rock", "Castle Rock", "Yosemite", "Mt Diablo", "Mission Cliff", "Granite Planet San Francisco", "Castle Rock", "Yosemite", "Mt Diablo", "Mission Cliff"]
	
//	var dates = ["June 14, 2015", "June 14, 2015", "June 12, 2015", "June 12, 2015", "May 15, 2015", "May 15, 2015", "May 15, 2015", "May 3, 2015", "May 3, 2015", "Apr 2, 2015", "Apr 2, 2015", "Apr 2, 2015", "Apr 2, 2015", "Mar 30, 2015", "Mar 30, 2015", "Mar 30, 2015", "Mar 19, 2015", "Mar 19, 2015", "Mar 19, 2015"]
	
	var dates = ["June 14, 2015", "June 12, 2015", "May 15, 2015", "May 3, 2015", "Apr 2, 2015", "Mar 30, 2015", "Mar 19, 2015"]
	
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		logTableView.delegate = self
		logTableView.dataSource = self
		
		// Scroll view size
		scrollView.contentSize = CGSizeMake(320, graphView.frame.height + logTableView.frame.height)
	
	}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
	
	func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//		return levels.count
		return 4
	}
	
	func tableView(tableView: UITableView, sectionForSectionIndexTitle title: String, atIndex index: Int) -> Int {
//		if index == 0 {
//			title = "June 14, 2015"
//		}
//		else if index == 1 {
//			title = "June 12, 2015"
//		}
//		else if index == 2 {
//			title = "May 15, 2015"
//		}
//		else if index == 3 {
//			title = "May 3, 2015"
//		}
//		else if index == 4 {
//			title = "Apr 2, 2015"
//		}
//		else if index == 5 {
//			title = "Mar 30, 2015"
//		}
//		else if index == 6 {
//			title = "Mar 19, 2015"
//		}
//		
		return 7
	}
	
	func numberOfSectionsInTableView(tableView: UITableView) -> Int {
		return dates.count
	}
	
	
//	func sectionIndexTitlesForTableView(tableView: UITableView) -> [AnyObject]! {
//		<#code#>
//	}
	
	
	func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		
//		println("Row: \(indexPath.row)")
		var cell = logTableView.dequeueReusableCellWithIdentifier("LogCell") as! LogCell
		
		cell.levelLabel.text = levels[indexPath.row]
		cell.locationLabel.text = locations[indexPath.row]
		
		return cell
	}
	
	func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
		var headerView = UIView(frame: CGRect(x: 0, y: 0, width: 320, height: 30))
		headerView.backgroundColor = UIColor(white: 0.2, alpha: 0.5)
		
		var label = UILabel(frame: CGRect(x: 10, y: 0, width: 300, height: 30))
		label.text = dates[section]
//		label.text = "June 14, 2015"
		headerView.addSubview(label)
		
		return headerView
	}
	
	func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
		return 40
	}
	
	
	override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
		if (segue.identifier == "logDetailSegue") {
			
			// initialize new view controller and cast it as your view controller
			var viewController = segue.destinationViewController as! LogDetailViewController
			
			let indexPath : NSIndexPath = self.logTableView.indexPathForSelectedRow()!
			
			// your new view controller should have property that will store passed value
			viewController.level = levels[indexPath.row]
			viewController.location = locations[indexPath.row]
		}
	}
	
}
