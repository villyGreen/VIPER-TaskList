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
    var view: PresenterToViewStartProtocol?
    var interactor: PresenterToInteractorStartProtocol?
    var router: PresenterToRouterStartProtocol?
}

extension StartPresenter: InteractorToPresenterStartProtocol {
    
}
