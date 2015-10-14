//
//  ViewController.swift
//  Trip Planner
//
//  Created by Jared Harkins on 10/12/15.
//  Copyright © 2015 Jared Harkins. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit

class ViewController: UIViewController {

    override func viewDidAppear(animated: Bool) {
        super.viewDidLoad()
        if (FBSDKAccessToken.currentAccessToken() == nil){
            print("Not logged in.")
        }else{
            print("Logged in.")
            self.performSegueWithIdentifier("afterLogin", sender: self)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func loginPressedEvent(sender: AnyObject) {
        let loginManager = FBSDKLoginManager.init()
        loginManager.logInWithReadPermissions(["public_profile", "email", "user_friends"], fromViewController: self) { (result, error) -> Void in
            if (error != nil){
                print("Process error")
            }else if(result.isCancelled){
                print("Cancelled")
            }else{
                print("Logged in")
            }
        }
    }
}

