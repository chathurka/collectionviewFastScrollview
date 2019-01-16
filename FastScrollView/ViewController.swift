//
//  ViewController.swift
//  FastScrollView
//
//  Created by Chathurka Roshan on 1/16/19.
//  Copyright © 2019 Chathurka Roshan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        let innerView = FastScrollView(frame: CGRect(x: 0, y: 0, width: 20, height: 100),names:["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"])
        self.view.addFastScrollView(view: innerView)
    }
}


extension UIView {
    func addFastScrollView (view:UIView) {
        view.frame = CGRect(x: Int(self.frame.size.width - 20), y: 0, width: 20, height: Int(self.frame.size.height))
        self.addSubview(view)
    }
}
