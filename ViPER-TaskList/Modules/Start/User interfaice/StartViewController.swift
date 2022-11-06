//
//  StartViewController.swift
//  ViPER-TaskList
//
//  Created by Green on 06.11.2022.
//  
//

import UIKit

class StartViewController: UIViewController {
    
    @IBOutlet private weak var welcomeLabel: UILabel!
    @IBOutlet private weak var tapButton: UIButton!
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Properties
    var presenter: ViewToPresenterStartProtocol?
    
    @IBAction func buttonAction(_ sender: Any) {
        presenter?.buttonWasTapped()
    }
}

extension StartViewController: PresenterToViewStartProtocol{
    
    func dataWasLoad(_ data: Data) {
        DispatchQueue.main.async {
            let string = String(data: data, encoding: .utf8)
            self.welcomeLabel.text = string
        }
    }
}
