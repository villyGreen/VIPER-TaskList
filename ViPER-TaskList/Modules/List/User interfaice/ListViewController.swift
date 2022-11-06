//
//  ListViewController.swift
//  ViPER-TaskList
//
//  Created by Green on 06.11.2022.
//  
//

import UIKit

class ListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupNavigationBar()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        presenter?.viewDidAppear()
    }

    // MARK: - Properties
    var presenter: ViewToPresenterListProtocol?
    
}

extension ListViewController: PresenterToViewListProtocol{
    // TODO: Implement View Output Methods
    func viewDidAppear() {
        DispatchQueue.main.async {
            self.tableView?.reloadData()
        }
    }
    
}
 
// MARK: - Setup Screen
private extension ListViewController {
    // Table View Configure
    private func setupTableView() {
        tableView?.delegate = self
        tableView?.dataSource = self
        tableView?.tableFooterView = UIView()
        tableView?.register(UINib(nibName: String(describing: ListTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: ListTableViewCell.self))
    }
    
    // UINavigation Bar configure
    private func setupNavigationBar() {
        self.title = "Daily tasks for you"
        let addButton = UIBarButtonItem(image: UIImage.add,
                                        style: .plain,
                                        target: self,
                                        action: #selector(addTask))
        
        navigationItem.rightBarButtonItem = addButton
    }
    
    @objc
    private func addTask() {
        self.showAlert(title: "Add new task",
                       message: "Hi, I'm smart task manager, please enter new task for me :)",
                       actionTitle: "Enter",
                       isCancelButton: true) { success, source in
            guard success else { return }
            self.presenter?.addData(source)
        }
    }
}

extension ListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ListTableViewCell.self), for: indexPath) as? ListTableViewCell
        guard let data = presenter?.getDataSource() else { return UITableViewCell()}
        cell?.configureCell(data: data[indexPath.row], indexPath: indexPath.row, delegate: self)

        return cell ?? UITableViewCell()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.getDataSource().count ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65
    }
}

extension ListViewController: ListTableViewDelegate {
    func deleteTaskFromIndexPath(_ indexPath: Int) {
        presenter?.deleteDataFromIndexPath(indexPath)
    }
}
