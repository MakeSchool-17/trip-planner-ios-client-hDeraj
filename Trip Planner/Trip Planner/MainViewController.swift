//
//  MainViewController.swift
//  Trip Planner
//
//  Created by Jared Harkins on 10/14/15.
//  Copyright © 2015 Jared Harkins. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class MainViewController : UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var trips = [Trip]()
    var selectedTrip : Int = 0
    
    @IBOutlet var tripTable: UITableView!
    
    var coreDataRef : CoreDataStack!
    
    override func viewWillAppear(animated: Bool) {
        let fetchRequest = NSFetchRequest(entityName : "Trip")
        
        var results: [Trip]?
        
        do {
            results = try coreDataRef.managedObjectContext.executeFetchRequest(fetchRequest) as? [Trip]
        } catch let error as NSError {
            print(error)
        }
        
        if let results = results {
            trips = results
        }
        tripTable.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tripTable.dataSource = self
        tripTable.delegate = self
        
        let applicationDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        coreDataRef = applicationDelegate.sharedCoreDataRef
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
        self.selectedTrip = indexPath.item
        self.performSegueWithIdentifier("showTrip", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier! == "showTrip" {
            let showTripViewController = segue.destinationViewController as? TripViewController
            
            if let viewController = showTripViewController {
                viewController.trip = self.trips[self.selectedTrip]
            }
        }
    }
}

class MainTripViewCell : UITableViewCell {
    
    @IBOutlet weak var tripName: UILabel!
}