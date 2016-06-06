//
//  Entity+CoreDataProperties.swift
//  MyAdoredShow
//
//  Created by Sreeanth Reddy on 04/06/16.
//  Copyright © 2016 Sreeanth Reddy. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Entity {

    @NSManaged var movieName: String?
    @NSManaged var movieDesc: String?
    @NSManaged var movieImage: NSData?
    @NSManaged var movieIMDBLink: String?
    @NSManaged var movieIMDBPlot: String?

}
