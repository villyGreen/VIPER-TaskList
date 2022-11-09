//
//  ListRouter.swift
//  ViPER-TaskList
//
//  Created by Green on 06.11.2022.
//  
//

import Foundation
import UIKit

class ListRouter: PresenterToRouterListProtocol {
    
    // MARK: Static methods
    static func createModule() -> UIViewController {
        
        guard let viewController = Storyboard.make(.list).instantiate(.listVC) as? ListViewController else { return UIViewController()}
        let presenter: ViewToPresenterListProtocol & InteractorToPresenterListProtocol = ListPresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = ListRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = ListInteractor()
        viewController.presenter?.interactor?.presenter = presenter
        
        return viewController
    }
    
}
