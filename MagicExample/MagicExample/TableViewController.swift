//
//  TableViewController.swift
//  MagicExample
//
//  Created by Broccoli on 2016/9/27.
//  Copyright © 2016年 broccoliii. All rights reserved.
//

import UIKit
import Magic

class TableViewController: UITableViewController {
    var dataSource = Array<String>()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        fetchServiceData()
        tableView.activityIndicatorView.startAnimating()
        tableView.tableFooterView = UIView()
    }

    func fetchServiceData() {
        5.delay {_ in
            self.dataSource = ["1", "3", "5", "7", "1", "3", "5", "7", "1", "3", "5", "7"]
            DispatchQueue.main.async {
                self.tableView.activityIndicatorView.stopAnimating()
                self.tableView.reloadData()
            }
        }
    }
}

// MARK: - Table view data source
extension TableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "TableViewCell")
        cell.textLabel?.text = dataSource[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.alpha = 0.0
        UIView .animate(withDuration: 0.25) {
            cell.alpha = 1.0
        }
    }
}
