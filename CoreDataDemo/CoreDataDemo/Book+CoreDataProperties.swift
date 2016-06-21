//
//  Book+CoreDataProperties.swift
//  CoreDataDemo
//
//  Created by KurtHo on 2016/6/16.
//  Copyright © 2016年 Kurt. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Book {

    @NSManaged var title: String?
    @NSManaged var price: NSDecimalNumber?
    @NSManaged var isbn: String?
    @NSManaged var author: String?

}
