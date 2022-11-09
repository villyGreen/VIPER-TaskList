//
//  UserDefaultsPropertyWrapper.swift
//  ViPER-TaskList
//
//  Created by Green on 06.11.2022.
//

import Foundation

private let defaults = UserDefaults.standard

@propertyWrapper
struct NonNilUserDefault<T> {
    let key: String
    let defaultValue: T

    init(_ key: String, defaultValue: T) {
        self.key = key
        self.defaultValue = defaultValue
        defaults.register(defaults: [key: defaultValue])
    }

    var wrappedValue: T {
        get {
            defaults.object(forKey: key) as? T ?? defaultValue
        }
        set {
            defaults.set(newValue, forKey: key)
        }
    }
}
