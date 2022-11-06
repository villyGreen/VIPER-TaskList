//
//  StartContract.swift
//  ViPER-TaskList
//
//  Created by Green on 06.11.2022.
//  
//

import Foundation


// MARK: View Output (Presenter -> View)
protocol PresenterToViewStartProtocol {
   
}


// MARK: View Input (View -> Presenter)
protocol ViewToPresenterStartProtocol {
    
    var view: PresenterToViewStartProtocol? { get set }
    var interactor: PresenterToInteractorStartProtocol? { get set }
    var router: PresenterToRouterStartProtocol? { get set }
}


// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorStartProtocol {
    
    var presenter: InteractorToPresenterStartProtocol? { get set }
}


// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterStartProtocol {
    
}


// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterStartProtocol {
    
}
