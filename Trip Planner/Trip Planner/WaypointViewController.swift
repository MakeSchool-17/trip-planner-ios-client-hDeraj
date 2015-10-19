//
//  WaypointViewController.swift
//  Trip Planner
//
//  Created by Jared Harkins on 10/14/15.
//  Copyright © 2015 Jared Harkins. All rights reserved.
//

import Foundation
import UIKit

class WaypointViewController : UIViewController {
    
    var waypoint : Waypoint!
    var coreDataRef : CoreDataStack!
    
    @IBOutlet weak var titleBar: UINavigationItem!
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        titleBar.title = waypoint.name
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let applicationDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        coreDataRef = applicationDelegate.sharedCoreDataRef
    }
    
}