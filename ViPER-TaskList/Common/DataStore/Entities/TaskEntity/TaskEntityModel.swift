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
    var dictionary: [EntityKey : Any] = [:]
    
    init(uuid: UUID, task: String, date: Date) {
        self.uuid = uuid
        self.task = task
        self.date = date
    }
    
    
    var uuid: UUID {
        set {
            dictionary[.uuid] = newValue
        } get {
            return (dictionary[.uuid] as? UUID) ?? UUID()
        }
    }
    var task: String {
        set {
            dictionary[.task] = newValue
        } get {
            return (dictionary[.task] as? String) ?? ""
        }
    }

    var date: Date {
        set {
            dictionary[.date] = newValue
        } get {
            return (dictionary[.date] as? Date) ?? Date()
        }
    }
}
