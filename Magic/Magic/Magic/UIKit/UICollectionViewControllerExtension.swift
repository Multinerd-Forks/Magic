//
//  UICollectionViewControllerExtension.swift
//  Magic
//
//  Created by Broccoli on 2016/9/21.
//  Copyright © 2016年 broccoliii. All rights reserved.
//

import Foundation

public extension UICollectionViewController {
    
    /**
     Adds activity indicator to the table view.
     http://stackoverflow.com/questions/29912852/how-to-show-activity-indicator-while-tableview-loads
     - returns: Returns an instance of the activity indicator that is centered.
     */
    // move to UICollectionView
    public var activityIndicatorView: UIActivityIndicatorView? {
        get {
            return view.viewWithTag(3000) as? UIActivityIndicatorView
        }
        
        set {
            DispatchQueue.main.async {
                newValue?.tag = 3000
                newValue?.center = self.view.center
                newValue?.hidesWhenStopped = true
                guard newValue != nil else {
                    return
                }
                self.view.addSubview(newValue!)
            }
        }
    }
    
    public func setupActivityIndicator(
        viewStyle: UIActivityIndicatorViewStyle = .gray,
        color: UIColor = UIColor.gray) {
        DispatchQueue.main.async {
            if self.activityIndicatorView == nil  {
                self.activityIndicatorView = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
            }
            self.activityIndicatorView?.activityIndicatorViewStyle = viewStyle
            self.activityIndicatorView?.color = color
            
            self.activityIndicatorView?.startAnimating()
        }
    }
}
