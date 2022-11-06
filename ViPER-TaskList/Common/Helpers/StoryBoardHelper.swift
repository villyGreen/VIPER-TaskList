//
//  StoryBoardHelper.swift
//  ViPER-TaskList
//
//  Created by Green on 06.11.2022.
//

import UIKit

enum Storyboard: String {
    case start = "Start"
    case list = "List"
    static func make(_ storyboard: Storyboard, bundle: Bundle? = .main) -> UIStoryboard {
        return UIStoryboard(name: storyboard.rawValue, bundle: bundle)
    }
}

enum StoryboardID: String {
   case start
    case listVC
}

extension UIStoryboard {
    func instantiate(_ identifier: StoryboardID) -> UIViewController {
        return self.instantiateViewController(withIdentifier: identifier.rawValue)
    }
}
