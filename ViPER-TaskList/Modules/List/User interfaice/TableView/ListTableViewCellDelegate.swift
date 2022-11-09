//
//  ListTableViewCellDelegate.swift
//  ViPER-TaskList
//
//  Created by Green on 06.11.2022.
//

import Foundation

protocol ListTableViewDelegate: AnyObject {
    func deleteTaskFromIndexPath(_ indexPath: Int)
}
