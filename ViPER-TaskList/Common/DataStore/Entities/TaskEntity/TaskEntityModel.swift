//
//  TaskEntityMode.swift
//  ViPER-TaskList
//
//  Created by Green on 06.11.2022.
//

import Foundation

enum EntityKey: String {
    case uuid
    case task
    case user
    case date
    case name
    case surname
}

struct Task: Entity {
    var dictionary: [EntityKey : Any]?
    var uuid: UUID {
        willSet {
            dictionary?[.uuid] = newValue
        }
    }
    var task: String {
        willSet {
            dictionary?[.task] = newValue
        }
    }
    var creator: User {
        willSet {
            dictionary?[.user] = newValue
        }
    }
    var date: Date {
        willSet {
            dictionary?[.date] = newValue
        }
    }
}
