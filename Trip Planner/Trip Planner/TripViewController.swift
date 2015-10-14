//
//  TripViewController.swift
//  Trip Planner
//
//  Created by Jared Harkins on 10/14/15.
//  Copyright © 2015 Jared Harkins. All rights reserved.
//

import Foundation
import UIKit
import FBSDKCoreKit

class TripViewController : UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var trip : Trip?
    var waypoints = [Waypoint]()
    @IBOutlet weak var tripDateLabel: UILabel!
    @IBOutlet weak var tripImageLabel: UIImageView!
    @IBOutlet weak var tripNameLabel: UILabel!
    @IBOutlet weak var titleBar: UINavigationItem!
    @IBOutlet weak var waypointsTable: UITableView!
    
    override func viewDidLoad() {
        waypointsTable.dataSource = self
        waypointsTable.delegate = self
        waypoints = trip!.waypoints
        titleBar.title = trip!.name
        tripNameLabel.text = trip!.name
        tripDateLabel.text = trip!.date.description
        waypoints += [Waypoint(name: "testing 123")]
        waypointsTable.reloadData()
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "WaypointViewCell"
        
        
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! WaypointViewCell
        
        //let waypoint = waypoints[indexPath.row]
        //cell.tripName.text = waypoint.name
        
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return waypoints.count
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //self.performSegueWithIdentifier("showTrip", sender: self)
    }
    
    // MARK: Add Item View Controller Delegate Methods
    func controller(controller: NewTripViewController, tripName: String, tripDate: NSDate) {
        let waypoint = Waypoint(name: tripName)
        self.waypoints += [waypoint]
        
        //self.tripTable.reloadData()
    }
}

struct Waypoint {
    var name : String
}

class WaypointViewCell : UITableViewCell {
    
}