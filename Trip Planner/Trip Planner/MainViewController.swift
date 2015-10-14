//
//  MainViewController.swift
//  Trip Planner
//
//  Created by Jared Harkins on 10/14/15.
//  Copyright © 2015 Jared Harkins. All rights reserved.
//

import Foundation
import UIKit
import FBSDKCoreKit

class MainViewController : UIViewController, UITableViewDelegate, UITableViewDataSource, NewTripViewControllerDelegate {
    
    var trips = [Trip]()
    
    @IBOutlet var tripTable: UITableView!
    
    override func viewDidLoad() {
        tripTable.dataSource = self
        tripTable.delegate = self
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "MainTripCellView"
        
        
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! MainTripViewCell
        
        let trip = trips[indexPath.row]
        cell.tripName.text = trip.name
        
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return trips.count
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.performSegueWithIdentifier("showTrip", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier! == "addTrip" {
            let addTripViewController = segue.destinationViewController as? NewTripViewController
            
            if let viewController = addTripViewController {
                viewController.delegate = self
            }
        }
        if segue.identifier! == "showTrip" {
            let showTripViewController = segue.destinationViewController as? TripViewController
            
            if let viewController = showTripViewController {
                viewController.trip = self.trips[0]
                viewController.waypoints = self.trips[0].waypoints
            }
        }
    }
    
    // MARK: Add Item View Controller Delegate Methods
    func controller(controller: NewTripViewController, tripName: String, tripDate: NSDate) {
        let trip = Trip(name: tripName, date: tripDate, waypoints: [])
        self.trips += [trip]
        
        self.tripTable.reloadData()
    }
}

struct Trip {
    var name : String
    var date : NSDate
    var waypoints : [Waypoint]
}

class MainTripViewCell : UITableViewCell {
    
    @IBOutlet weak var tripName: UILabel!
}