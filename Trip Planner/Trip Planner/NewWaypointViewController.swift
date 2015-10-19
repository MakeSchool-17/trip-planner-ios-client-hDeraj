//
//  NewWaypointViewController.swift
//  Trip Planner
//
//  Created by Jared Harkins on 10/14/15.
//  Copyright © 2015 Jared Harkins. All rights reserved.
//

import Foundation
import UIKit
import MapKit

class NewWaypointViewController : UIViewController {
    
    var trip : Trip!
    var coreDataRef : CoreDataStack!
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var titleBar: UINavigationItem!
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }

    @IBAction func onDoneButtonPressed(sender: AnyObject) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let applicationDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        coreDataRef = applicationDelegate.sharedCoreDataRef
    }
    
}