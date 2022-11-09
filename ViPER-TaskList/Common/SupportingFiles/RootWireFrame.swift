//
//  RootWireFrame.swift
//  ViPER-TaskList
//
//  Created by Green on 06.11.2022.
//

import UIKit

final class RootWireFrame {
    @NonNilUserDefault("is_first_launch", defaultValue: true)
    private var firstLaunch: Bool?
        
    func checkFirstLaunch() -> UIViewController? {
        guard _firstLaunch.wrappedValue ?? false else { return
            UINavigationController(rootViewController: ListRouter.createModule())}
        _firstLaunch.wrappedValue?.toggle()
        return StartRouter.createModule()
    }
}
