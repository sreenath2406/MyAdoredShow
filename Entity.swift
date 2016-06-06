//
//  Entity.swift
//  MyAdoredShow
//
//  Created by Sreeanth Reddy on 04/06/16.
//  Copyright © 2016 Sreeanth Reddy. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class Entity: NSManagedObject {

// Insert code here to add functionality to your managed object subclass

    func setMovieImageIMDB(img: UIImage) {
        let data = UIImagePNGRepresentation(img)
        self.movieImage = data
    }
    
    func getMovieImageIMDB() -> UIImage {
        let img = UIImage(data: self.movieImage!)!
        return img
    }
}
