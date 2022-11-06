//
//  StartViewController.swift
//  ViPER-TaskList
//
//  Created by Green on 06.11.2022.
//  
//

import UIKit

class StartViewController: UIViewController {
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Properties
    var presenter: ViewToPresenterStartProtocol?
    
}

extension StartViewController: PresenterToViewStartProtocol{
    // TODO: Implement View Output Methods
}
