//
//  StartInteractor.swift
//  ViPER-TaskList
//
//  Created by Green on 06.11.2022.
//  
//

import Foundation

class StartInteractor: PresenterToInteractorStartProtocol {
    // MARK: Properties
    weak var presenter: InteractorToPresenterStartProtocol?
    
    func tapButtonTapped() {
        let string = "data was load"
        let data = string.data(using: .utf8)
        presenter?.dataWasLoad(data ?? Data())
    }
}
