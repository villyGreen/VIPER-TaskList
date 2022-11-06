//
//  EntityProtocol.swift
//  ViPER-TaskList
//
//  Created by Green on 06.11.2022.
//

import Foundation

protocol Entity {
    var dictionary: [EntityKey: Any]? { get set }
}
