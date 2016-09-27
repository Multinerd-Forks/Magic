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

        tableView.tableFooterView = UIView()
        
        fetchServiceData()
        setupActivityIndicator()
    }

    func fetchServiceData() {
        5.delay {
            self.dataSource = ["1", "3", "5", "7"]
            DispatchQueue.main.async {
                self.activityIndicatorView?.removeFromSuperview()
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
        return cell
    }
}
