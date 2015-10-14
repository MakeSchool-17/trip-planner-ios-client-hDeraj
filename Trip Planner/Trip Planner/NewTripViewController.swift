//
//  NewTripViewController.swift
//  Trip Planner
//
//  Created by Jared Harkins on 10/14/15.
//  Copyright © 2015 Jared Harkins. All rights reserved.
//

import Foundation
import UIKit
import FBSDKCoreKit

protocol NewTripViewControllerDelegate {
    func controller(controller: NewTripViewController, tripName: String, tripDate: NSDate)
}

class NewTripViewController : UIViewController {
    
    @IBOutlet weak var tripNameInput: UITextField!
    @IBOutlet weak var tripDateInput: UIDatePicker!
    
    var delegate: NewTripViewControllerDelegate?
    
    @IBAction func doneButtonPressed(sender: AnyObject) {
        if let delegate = self.delegate {
            delegate.controller(self, tripName: tripNameInput.text!,
                tripDate: tripDateInput.date)
        }
        
        self.navigationController?.popViewControllerAnimated(true)
    }
}