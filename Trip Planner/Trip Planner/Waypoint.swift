//
//  Waypoint.swift
//  Trip Planner
//
//  Created by Jared Harkins on 10/15/15.
//  Copyright © 2015 Jared Harkins. All rights reserved.
//

import Foundation
import CoreData

class Waypoint: NSManagedObject {

    convenience init(context : NSManagedObjectContext){
        let entityDescription = NSEntityDescription.entityForName("Waypoint", inManagedObjectContext: context)!
        
        self.init(entity: entityDescription, insertIntoManagedObjectContext: context)
    }

}
