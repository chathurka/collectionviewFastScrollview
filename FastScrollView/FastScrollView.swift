//
//  FastScrollView.swift
//  FastScrollView
//
//  Created by Chathurka Roshan on 1/16/19.
//  Copyright © 2019 Chathurka Roshan. All rights reserved.
//

import UIKit

class FastScrollView: UIView {
    @IBOutlet weak var table: UITableView? {
        didSet {
            self.table?.tableFooterView = UIView()
            self.table?.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        }
    }
    
    var alphabatics:[String] = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
    var view: UIView!
    let cellName = "FastScrollView"
    
    var didSelectIndexTitle:((String)->())?
    
    convenience init(frame: CGRect, names:[String]) {
        self.init(frame: frame)
        self.alphabatics.removeAll()
        self.alphabatics.append(contentsOf: names)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func xibSetup() {
        view = loadViewFromNib()
        view.frame = bounds
        view.autoresizingMask = [UIView.AutoresizingMask.flexibleWidth, UIView.AutoresizingMask.flexibleHeight]
        addSubview(view)
    }
    
    func loadViewFromNib() -> UIView {
        let bundle = Bundle(for: type(of:self))
        let nib = UINib(nibName: self.cellName, bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        
        return view
    }
}

extension FastScrollView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.alphabatics.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = self.alphabatics[indexPath.row]
        
        return cell
    }
}

// MARK:- UITableViewDelegate

extension FastScrollView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let closure = self.didSelectIndexTitle {
            closure(self.alphabatics[indexPath.row])
        }
    }
}


