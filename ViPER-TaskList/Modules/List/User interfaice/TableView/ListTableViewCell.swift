//
//  ListTableViewCell.swift
//  ViPER-TaskList
//
//  Created by Green on 06.11.2022.
//

import UIKit

class ListTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var taskName: UILabel!
    @IBOutlet private weak var dateLabel: UILabel!
    weak var delegate: ListTableViewDelegate?
    private var indexPath: Int?
    
    func configureCell(data: Task, indexPath: Int, delegate: ListTableViewDelegate) {
        self.selectionStyle = .none
        self.taskName.text = data.task
        self.dateLabel.text = "\(data.date)"
        self.indexPath = indexPath
        self.delegate = delegate
    }
    
    @IBAction private func deleteTask(_ sender: Any) {
        delegate?.deleteTaskFromIndexPath(indexPath ?? 0)
    }
}
