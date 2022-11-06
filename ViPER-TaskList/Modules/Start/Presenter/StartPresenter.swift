//
//  StartPresenter.swift
//  ViPER-TaskList
//
//  Created by Green on 06.11.2022.
//  
//

import Foundation

class StartPresenter: ViewToPresenterStartProtocol {
    
    // MARK: Properties
    weak var view: PresenterToViewStartProtocol?
    var interactor: PresenterToInteractorStartProtocol?
    var router: PresenterToRouterStartProtocol?
    
    func buttonWasTapped() {
        interactor?.tapButtonTapped()
    }
    
    func presentToListViewController() {
        StartRouter.presentListModule { [weak self] viewController in
            self?.view?.presentToListViewController(viewController)
        }
    }
    
}

extension StartPresenter: InteractorToPresenterStartProtocol {
    func dataWasLoad(_ data: Data) {
        view?.dataWasLoad(data)
    }
}
