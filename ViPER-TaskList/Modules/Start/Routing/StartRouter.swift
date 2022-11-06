//
//  StartRouter.swift
//  ViPER-TaskList
//
//  Created by Green on 06.11.2022.
//  
//

import Foundation
import UIKit

class StartRouter: PresenterToRouterStartProtocol {
    
    // MARK: Static methods
    static func createModule() -> UIViewController {
        
        let viewController = StartViewController()
        
        let presenter: ViewToPresenterStartProtocol & InteractorToPresenterStartProtocol = StartPresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = StartRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = StartInteractor()
        viewController.presenter?.interactor?.presenter = presenter
        
        return viewController
    }
    
}
