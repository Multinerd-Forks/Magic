//
//  MasterTableViewController.swift
//  MagicExample
//
//  Created by Broccoli on 2016/9/27.
//  Copyright © 2016年 broccoliii. All rights reserved.
//

import UIKit
import Magic

class MasterTableViewController: UITableViewController {
    let demoArray = ["TableViewDemo"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - Table view data source
extension MasterTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "MasterTableViewCell")
        if indexPath.row == 0 {
            cell.textLabel?.text = "TableViewDemo"
        }
        return cell
    }
    
    // MARK: - Table view delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            let tableViewController = storyboard?.instantiateViewController(viewController:  TableViewController.self)
            navigationController?.pushViewController(tableViewController!, animated: true)
        }
    }
}
