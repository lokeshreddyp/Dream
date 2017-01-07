//
//  Item+CoreDataClass.swift
//  Dream
//
//  Created by lokeshreddy on 1/6/17.
//  Copyright © 2017 lokeshreddy. All rights reserved.
//

import Foundation
import CoreData


public class Item: NSManagedObject {

    //when item is inserted then assign current date to attribute created
    public override func awakeFromInsert() {
        super.awakeFromInsert()
        self.created = NSDate()
    }
}
