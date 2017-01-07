//
//  ItemType+CoreDataProperties.swift
//  Dream
//
//  Created by lokeshreddy on 1/6/17.
//  Copyright © 2017 lokeshreddy. All rights reserved.
//

import Foundation
import CoreData


extension ItemType {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ItemType> {
        return NSFetchRequest<ItemType>(entityName: "ItemType");
    }

    @NSManaged public var type: String?
    @NSManaged public var toItem: Item?

}
