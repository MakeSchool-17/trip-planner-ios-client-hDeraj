//
//  TripViewController.swift
//  Trip Planner
//
//  Created by Jared Harkins on 10/14/15.
//  Copyright © 2015 Jared Harkins. All rights reserved.
//

import Foundation
import UIKit

class TripViewController : UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var trip : Trip!
    var selectedWaypoint : Int = 0
    var coreDataRef : CoreDataStack!
    
    @IBOutlet weak var tripDateLabel: UILabel!
    @IBOutlet weak var tripImageLabel: UIImageView!
    @IBOutlet weak var tripNameLabel: UILabel!
    @IBOutlet weak var titleBar: UINavigationItem!
    @IBOutlet weak var waypointsTable: UITableView!
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        waypointsTable.dataSource = self
        waypointsTable.delegate = self
        
        let applicationDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        coreDataRef = applicationDelegate.sharedCoreDataRef
        
        titleBar.title = trip.name
        tripNameLabel.text = trip.name
        tripDateLabel.text = trip.date?.description
        waypointsTable.reloadData()
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "WaypointViewCell"
        
        
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! WaypointViewCell
        
        let waypoints = trip.waypoints?.array as! [Waypoint]
        let waypoint = waypoints[indexPath.row]
        cell.waypointNameLabel.text = waypoint.name
        
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return trip.waypoints!.count
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        selectedWaypoint = indexPath.item
        self.performSegueWithIdentifier("showTrip", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier! == "viewWaypoint" {
            let waypointViewController = segue.destinationViewController as? WaypointViewController
            
            if let viewController = waypointViewController {
                viewController.waypoint = self.trip.waypoints![self.selectedWaypoint] as! Waypoint
            }
        }
    }
    
}

class WaypointViewCell : UITableViewCell {
    
    @IBOutlet weak var waypointNameLabel: UILabel!
}