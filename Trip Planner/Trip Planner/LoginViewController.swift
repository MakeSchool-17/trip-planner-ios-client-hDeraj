//
//  ViewController.swift
//  Trip Planner
//
//  Created by Jared Harkins on 10/12/15.
//  Copyright © 2015 Jared Harkins. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func loginPressedEvent(sender: AnyObject) {
        self.performSegueWithIdentifier("afterLogin", sender: self)
    }
}