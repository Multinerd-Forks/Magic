//
//  UICollectionViewExtension.swift
//  Magic
//
//  Created by Broccoli on 2016/9/22.
//  Copyright © 2016年 broccoliii. All rights reserved.
//

import Foundation

public extension UICollectionView {
    public class var defaultCellIdentifier: String {
        return "Cell"
    }
    
    public func registerNib(nibName: String, cellIdentifier: String = defaultCellIdentifier, bundleIdentifier: String? = nil) {
        register(UINib(nibName: nibName,
                               bundle: bundleIdentifier != nil ? Bundle(identifier: bundleIdentifier!) : nil),
                         forCellWithReuseIdentifier: cellIdentifier)
    }

    public subscript(indexPath: IndexPath) -> UICollectionViewCell {
        return dequeueReusableCell(withReuseIdentifier: UICollectionView.defaultCellIdentifier, for: indexPath)
    }

    public subscript(indexPath: IndexPath, identifier: String) -> UICollectionViewCell {
        return dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath)
    }
}

public extension UICollectionView {
    
    func insert(indexes: [Int], section: Int = 0, completion: (() -> Void)? = nil) {
        let indexPaths = indexes.map {
            IndexPath(item: $0, section: section)
        }
        // TODO: weak self?
        performBatchUpdates({ [weak self] in
            guard let weakSelf = self else {
                return
            }
            weakSelf.insertItems(at: indexPaths)
        }) { _ in
            completion?()
        }
    }
    
    func reload(indexes: [Int], section: Int = 0, completion: (() -> Void)? = nil) {
        let indexPaths = indexes.map {
            IndexPath(item: $0, section: section)
        }
        performBatchUpdates({ [weak self] in
            guard let weakSelf = self else {
                return
            }
            weakSelf.reloadItems(at: indexPaths)
        }) { _ in
            completion?()
        }
    }
    
    func delete(indexes: [Int], section: Int = 0, completion: (() -> Void)? = nil) {
        let indexPaths = indexes.map {
            IndexPath(item: $0, section: section)
        }
        performBatchUpdates({ [weak self] in
            guard let weakSelf = self else { return }
            weakSelf.deleteItems(at: indexPaths)
        }) { _ in
            completion?()
        }
    }
    
    func reloadSection(index: Int = 0, completion: (() -> Void)? = nil) {
        performBatchUpdates({ [weak self] in
            guard let weakSelf = self else { return }
            weakSelf.reloadSections(IndexSet(integer: index))
        }) { _ in
            completion?()
        }
    }
}
