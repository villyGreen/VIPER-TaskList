//
//  DataStore.swift
//  ViPER-TaskList
//
//  Created by Green on 06.11.2022.
//

import Foundation

final class DataStore {
    var store: CoreDataEngine {
        return .sharedInstance
    }
}
