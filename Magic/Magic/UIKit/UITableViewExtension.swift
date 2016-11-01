//
//  UITableViewExtension.swift
//  Magic
//
//  Created by Broccoli on 2016/9/22.
//  Copyright © 2016年 broccoliii. All rights reserved.
//

import Foundation

public extension UITableView {
    class var defaultCellIdentifier: String {
        return "Cell"
    }
    
    func registerNib(nibName: String, cellIdentifier: String = defaultCellIdentifier, bundleIdentifier: String? = nil) {
        register(UINib(nibName: nibName,
                               bundle: bundleIdentifier != nil ? Bundle(identifier: bundleIdentifier!) : nil),
                         forCellReuseIdentifier: cellIdentifier)
    }
    
    subscript(indexPath: IndexPath) -> UITableViewCell {
        return dequeueReusableCell(withIdentifier: UITableView.defaultCellIdentifier, for: indexPath)
    }
    
    subscript(indexPath: IndexPath, identifier: String) -> UITableViewCell {
        return dequeueReusableCell(withIdentifier: identifier, for: indexPath)
    }
}

public extension UITableView {
    
    /**
     Remove table header view
     */
    func emptyTableHeaderView() {
        tableHeaderView = UIView(frame:  CGRect(x: 0, y: 0, width: 0, height: 0.1))
    }
    
    /**
     Remove table footer view
     */
    func emptyTableFooterView() {
        tableFooterView = UIView(frame:  CGRect(x: 0, y: 0, width: 0, height: 0.1))
    }

    
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
        if animation == .none {
            UIView.setAnimationsEnabled(true)
        }
    }
    
    private func performUpdates( closure: () -> Void) {
        beginUpdates()
        closure()
        endUpdates()
    }
}

fileprivate var kTableViewPlaceholderViewAssociativeKey = "kTableViewPlaceholderViewAssociativeKey"

extension UITableView {
    
    open override class func initialize() {
        guard self === UITableView.self else { return }
        methodSwizzling(self, originalSelector: #selector(self.reloadData), swizzledSelector: #selector(self.magic_reloadData))
    }
    
    func magic_reloadData() {
        self.magic_reloadData()
        self.checkEmptyDataSource()
    }
    
    var placeholderView: UIView? {
        get {
            return getAssociatedObject(&kTableViewPlaceholderViewAssociativeKey) as? UIView
        }
        
        set {
            setAssociatedObject(newValue, associativeKey:&kTableViewPlaceholderViewAssociativeKey, policy: .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    private func checkEmptyDataSource() {
        weak var dataSourceHandler = self.dataSource
        var sectionsNumber = 1
        if dataSourceHandler!.responds(to: #selector(UITableViewDataSource.tableView(_:numberOfRowsInSection:))) {
            sectionsNumber = dataSourceHandler!.numberOfSections!(in: self)
        }
        var isEmptyDataSource = true
        for i in 0..<sectionsNumber {
            let rows = dataSourceHandler!.tableView(self, numberOfRowsInSection: i)
            if rows > 0 {
                isEmptyDataSource = false
            }
        }
        
        if isEmptyDataSource {
            self.placeholderView?.frame = CGRect(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height)
            guard let placeholderView = self.placeholderView else {
                return
            }
            self.addSubview(placeholderView)
        } else {
            self.placeholderView?.removeFromSuperview()
        }
    }
}
