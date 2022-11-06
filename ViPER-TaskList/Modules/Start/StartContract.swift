//
//  StartContract.swift
//  ViPER-TaskList
//
//  Created by Green on 06.11.2022.
//  
//

import Foundation


// MARK: View Output (Presenter -> View)
protocol PresenterToViewStartProtocol: AnyObject {
    func dataWasLoad(_ data: Data)
}


// MARK: View Input (View -> Presenter)
protocol ViewToPresenterStartProtocol {
    
    var view: PresenterToViewStartProtocol? { get set }
    var interactor: PresenterToInteractorStartProtocol? { get set }
    var router: PresenterToRouterStartProtocol? { get set }
    
    func buttonWasTapped()
}


// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorStartProtocol {
    
    var presenter: InteractorToPresenterStartProtocol? { get set }
    func tapButtonTapped()
}


// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterStartProtocol: AnyObject {
    func dataWasLoad(_ data: Data)
}


// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterStartProtocol {
}
