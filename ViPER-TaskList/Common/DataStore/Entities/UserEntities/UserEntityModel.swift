//
//  UserEntityModel.swift
//  ViPER-TaskList
//
//  Created by Green on 06.11.2022.
//

import Foundation
import CoreData

class User: NSManagedObject {
    @NSManaged var name: String
    @NSManaged var surname: String
}

