//
//  SegueHandlerType.swift
//  Magic
//
//  Created by Broccoli on 2016/9/24.
//  Copyright © 2016年 broccoliii. All rights reserved.
//

import Foundation

// https://developer.apple.com/library/content/samplecode/Lister/Listings/Lister_SegueHandlerType_swift.html
protocol SegueHandlerType {
    associatedtype SegueIdentifier: RawRepresentable
}

extension SegueHandlerType where Self: UIViewController, SegueIdentifier.RawValue == String {
    
    func performSegue(withIdentifier identifier: SegueIdentifier, sender: AnyObject?) {
        performSegue(withIdentifier: identifier.rawValue, sender: sender)
    }
    
    func segueIdentifierForSegue(segue: UIStoryboardSegue) -> SegueIdentifier {
        guard
            let identifier = segue.identifier,
            let segueIdentifier = SegueIdentifier(rawValue: identifier) else {
                fatalError("INVALID SEGUE IDENTIFIER \(segue.identifier)")
        }
        return segueIdentifier
    }
}
