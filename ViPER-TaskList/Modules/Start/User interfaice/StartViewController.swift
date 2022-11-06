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
    func presentToListViewController(_ viewController: ListViewController) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5, execute: {
            let naviatioController = UINavigationController(rootViewController: viewController)
            naviatioController.modalPresentationStyle = .fullScreen
            naviatioController.modalTransitionStyle = .partialCurl
            self.present(naviatioController, animated: true)
        })
    }
    
    
    func dataWasLoad(_ data: Data) {
        DispatchQueue.main.async {
            let string = String(data: data, encoding: .utf8)
            self.welcomeLabel.text = string
            self.presenter?.presentToListViewController()
        }
    }
}
