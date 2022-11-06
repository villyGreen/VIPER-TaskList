//
//  ListPresenter.swift
//  ViPER-TaskList
//
//  Created by Green on 06.11.2022.
//  
//

import Foundation

class ListPresenter: ViewToPresenterListProtocol {
    
    // MARK: Properties
    var view: PresenterToViewListProtocol?
    var interactor: PresenterToInteractorListProtocol?
    var router: PresenterToRouterListProtocol?
    
    // MARK: - Methods
    func getDataSource() -> [Task] {
        return interactor?.dataSource ?? [Task]()
    }
    
    func viewDidAppear() {
        interactor?.getDataFromStorage()
        view?.viewDidAppear()
    }
    
    func addData(_ data: String) {
        let user = User()
        user.name = "Sasha"
        user.surname = "KuKa"
        let task = Task(uuid: UUID(), task: data, creator: user, date: Date())
        interactor?.addDataToStorage(task)
    }

}

extension ListPresenter: InteractorToPresenterListProtocol {
    func updateData() {
        self.viewDidAppear()
    }
    
    func fetchDataFromStorage(_ data: [Task]?) {
        
    }
}
