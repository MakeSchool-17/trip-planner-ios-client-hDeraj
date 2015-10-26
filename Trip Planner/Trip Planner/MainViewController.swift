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
      
        /*
          TODO: I would consider moving this CoreData request including error handling code into
          a separate class; prevents this VC from becoming complex
        */
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
      
        /*
          TODO: Instead of getting this reference from the AppDelegate it would be better to hand the reference
          from the AppDelegate to this View Controller. This concept is called "dependency injection" and it allows 
          you to write unit tests easier because you can replace the dependencies of the class easliy. For testing
          you could replace the real CoreData stack with an in-memory one. Let me know if this description is unclear :)
        */
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
        // TODO: Typically we avoid 'self' references in Swift and only use them when necessary
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