//
//  MagicBall.swift
//  MagicBall
//
//  Created by Rodrigo Machado on 8/19/15.
//  Copyright © 2015 BEPiD. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class MagicBall: NSManagedObject
{
    func saveData() -> Void
    {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        let entity = NSEntityDescription.entityForName("MagicBall", inManagedObjectContext: managedContext)
        let atribute = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: managedContext)
        
        
    }
    
}
