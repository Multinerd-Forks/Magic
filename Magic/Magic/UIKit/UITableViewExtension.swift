//
//  UITableViewExtension.swift
//  Magic
//
//  Created by Broccoli on 2016/9/22.
//  Copyright © 2016年 broccoliii. All rights reserved.
//

import Foundation

public extension UITableView {
    public class var defaultCellIdentifier: String {
        return "Cell"
    }
    
    func registerNib(nibName: String, cellIdentifier: String = defaultCellIdentifier, bundleIdentifier: String? = nil) {
        register(UINib(nibName: nibName,
                               bundle: bundleIdentifier != nil ? Bundle(identifier: bundleIdentifier!) : nil),
                         forCellReuseIdentifier: cellIdentifier)
    }
    
    public subscript(indexPath: IndexPath) -> UITableViewCell {
        return dequeueReusableCell(withIdentifier: UITableView.defaultCellIdentifier, for: indexPath)
    }
    
    public subscript(indexPath: IndexPath, identifier: String) -> UITableViewCell {
        return dequeueReusableCell(withIdentifier: identifier, for: indexPath)
    }
}

public extension UITableView {
    
    func insert(indexes: [Int], section: Int = 0, animation: UITableViewRowAnimation = .automatic) {
        let indexPaths = indexes.map {
            IndexPath(row: $0, section: section)
        }
        
        if animation == .none {
            UIView.setAnimationsEnabled(false)
        }
        performUpdates {
            insertRows(at: indexPaths, with: animation)
        }
        if animation == .none {
            UIView.setAnimationsEnabled(true)
        }
    }
    
    func reload(indexes: [Int], section: Int = 0, animation: UITableViewRowAnimation = .automatic) {
        let indexPaths = indexes.map {
            IndexPath(row: $0, section: section)
        }
        if animation == .none {
            UIView.setAnimationsEnabled(false)
        }
        performUpdates {
            reloadRows(at: indexPaths, with: animation)
        }
        if animation == .none {
            UIView.setAnimationsEnabled(true)
        }
    }
    
    func delete(indexes: [Int], section: Int = 0, animation: UITableViewRowAnimation = .automatic) {
        let indexPaths = indexes.map {
            IndexPath(row: $0, section: section)
        }
        if animation == .none {
            UIView.setAnimationsEnabled(false)
        }
        performUpdates {
            deleteRows(at: indexPaths, with: animation)
        }
        if animation == .none {
            UIView.setAnimationsEnabled(true)
        }
    }
    
    func reloadSection(section: Int = 0, animation: UITableViewRowAnimation = .automatic) {
        if animation == .none {
            UIView.setAnimationsEnabled(false)
        }
        performUpdates {
            reloadSections(IndexSet(integer: section), with: animation)
        }
        if animation == .none { UIView.setAnimationsEnabled(true) }
    }
    
    fileprivate func performUpdates( closure: () -> Void) {
        beginUpdates()
        closure()
        endUpdates()
    }
}
