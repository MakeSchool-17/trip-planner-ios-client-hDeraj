//
//  Trip.swift
//  Trip Planner
//
//  Created by Jared Harkins on 10/15/15.
//  Copyright © 2015 Jared Harkins. All rights reserved.
//

import Foundation
import CoreData

class Trip: NSManagedObject {

    convenience init(context : NSManagedObjectContext){
        let entityDescription = NSEntityDescription.entityForName("Trip", inManagedObjectContext: context)!
        
        self.init(entity: entityDescription, insertIntoManagedObjectContext: context)
    }

}
