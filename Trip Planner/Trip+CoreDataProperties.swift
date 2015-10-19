//
//  Trip+CoreDataProperties.swift
//  Trip Planner
//
//  Created by Jared Harkins on 10/15/15.
//  Copyright © 2015 Jared Harkins. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Trip {

    @NSManaged var date: NSDate?
    @NSManaged var name: String?
    @NSManaged var waypoints: NSOrderedSet?

}
