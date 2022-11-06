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
    static func createModule() -> UIViewController? {
        
        guard let viewController = Storyboard.make(.start).instantiate(.start)
                as? StartViewController else { return nil }
        
        let presenter: ViewToPresenterStartProtocol & InteractorToPresenterStartProtocol = StartPresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = StartRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = StartInteractor()
        viewController.presenter?.interactor?.presenter = presenter
        
        return viewController
    }
    
    static func presentListModule(completion:
                                  @escaping (_ viewController: ListViewController) -> Void) {
        guard let listViewController = ListRouter.createModule() as? ListViewController else { return }
        completion(listViewController)
    }
}
