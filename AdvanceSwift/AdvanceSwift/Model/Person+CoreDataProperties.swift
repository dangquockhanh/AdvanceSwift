//
//  Person+CoreDataProperties.swift
//  AdvanceSwift
//
//  Created by Đặng Khánh  on 7/30/20.
//  Copyright © 2020 Đặng Khánh . All rights reserved.
//
//

import Foundation
import CoreData


extension Person {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Person> {
        return NSFetchRequest<Person>(entityName: "Person")
    }

    @NSManaged public var name: String?
    @NSManaged public var age: Int64
    @NSManaged public var gender: String?

}
