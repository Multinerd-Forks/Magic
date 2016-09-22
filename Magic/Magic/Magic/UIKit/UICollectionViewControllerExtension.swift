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
    var activityIndicatorView: UIActivityIndicatorView {
        get {
            return self.activityIndicatorView
        }
        
        set {
            
        }
    }
    
    public func setupActivityIndicator(
        viewStyle: UIActivityIndicatorViewStyle = .whiteLarge,
        color: UIColor = UIColor.gray) -> UIActivityIndicatorView {
        activityIndicatorView = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        activityIndicatorView.activityIndicatorViewStyle = viewStyle
        activityIndicatorView.color = color
        activityIndicatorView.hidesWhenStopped = true
        activityIndicatorView.center = view.center
        
        view.addSubview(activityIndicatorView)
        
        return activityIndicatorView
    }
    
}
