//
//  TextViewViewController.swift
//  MagicExample
//
//  Created by Broccoli on 2016/9/30.
//  Copyright © 2016年 broccoliii. All rights reserved.
//

import UIKit

class TextViewViewController: UIViewController {

    @IBOutlet var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        textView.placeholder = "placeholderplaceholderplaceholderplaceholderplaceholderplaceholderplaceholderplaceholderplaceholder"
    }
}
