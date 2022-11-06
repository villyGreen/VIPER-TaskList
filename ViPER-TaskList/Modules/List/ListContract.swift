//
//  ListContract.swift
//  ViPER-TaskList
//
//  Created by Green on 06.11.2022.
//  
//

import Foundation


// MARK: View Output (Presenter -> View)
protocol PresenterToViewListProtocol {
    func viewDidAppear()
}


// MARK: View Input (View -> Presenter)
protocol ViewToPresenterListProtocol {
    
    var view: PresenterToViewListProtocol? { get set }
    var interactor: PresenterToInteractorListProtocol? { get set }
    var router: PresenterToRouterListProtocol? { get set }
    func getDataSource() -> [Task]
    func viewDidAppear()
    func addData(_ data: String)
    func deleteDataFromIndexPath(_ indexPath: Int)
}


// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorListProtocol {
    
    var presenter: InteractorToPresenterListProtocol? { get set }
    var dataSource: [Task]? { get set }
    
    func getDataFromStorage()
    func addDataToStorage(_ data: Task)
    func deleteDataFromStorage(indexPath: Int)
}


// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterListProtocol {
    func fetchDataFromStorage(_ data: [Task]?)
    func updateData()
}


// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterListProtocol {
    
}
