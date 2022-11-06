//
//  ListInteractor.swift
//  ViPER-TaskList
//
//  Created by Green on 06.11.2022.
//  
//

import Foundation

class ListInteractor: PresenterToInteractorListProtocol {
 
    // MARK: Properties
    var presenter: InteractorToPresenterListProtocol?
    var dataSource: [Task]?
    private let dataStore = DataStore()
    
    // MARK: - Methods
    func getDataFromStorage() {
        self.dataSource = dataStore.store.fetch(cdEntity: .tasks) as? [Task]
        presenter?.fetchDataFromStorage(dataSource)
    }
    
    func addDataToStorage(_ data: Task) {
        dataStore.store.save(data, cdEntity: .tasks)
        getDataFromStorage()
        presenter?.updateData()
    }
    
    func deleteDataFromStorage(_ data: Task) {
        dataStore.store.delete(data, cdEntity: .tasks)
        getDataFromStorage()
        presenter?.updateData()
    }
}
