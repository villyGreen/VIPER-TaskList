//
//  Extensions.swift
//  ViPER-TaskList
//
//  Created by Green on 06.11.2022.
//

import UIKit

extension UIViewController {
    func showAlert(title: String, message: String, actionTitle: String, isCancelButton: Bool,
                   completion: @escaping ((Bool, String) -> Void)) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: actionTitle, style: .default) { _ in
            completion(true, alert.textFields?.first?.text ?? "")
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive, handler: nil)
        alert.addAction(alertAction)
        alert.addAction(cancelAction)
        if isCancelButton {
            alert.addTextField { _ in
                alert.textFields?.first?.placeholder = "Enter your task"
            }
        }
        self.present(alert, animated: true)
    }
}
