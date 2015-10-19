//
//  NewTripViewController.swift
//  Trip Planner
//
//  Created by Jared Harkins on 10/14/15.
//  Copyright © 2015 Jared Harkins. All rights reserved.
//

import Foundation
import UIKit

class NewTripViewController : UIViewController {
    
    @IBOutlet weak var tripNameInput: UITextField!
    @IBOutlet weak var tripDateInput: UIDatePicker!
    
    var coreDataRef : CoreDataStack!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let applicationDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        coreDataRef = applicationDelegate.sharedCoreDataRef
    }
    
    @IBAction func doneButtonPressed(sender: AnyObject) {
        if(tripNameInput.text! != ""){
            let trip = Trip(context: coreDataRef.managedObjectContext)
            trip.name = tripNameInput.text!
            trip.date = tripDateInput.date
        }
        
        self.navigationController?.popViewControllerAnimated(true)
    }
}