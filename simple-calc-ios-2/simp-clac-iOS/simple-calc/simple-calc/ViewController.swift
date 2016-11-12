//
//  ViewController.swift
//  simple-calc
//
//  Created by sam wahbeh on 10/29/16.
//  Copyright © 2016 sam wahbeh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var UIScroll: UIScrollView!
    let screenSize: CGRect = UIScreen.main.bounds
    var history = [""]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in 0..<history.count{
            let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
            label.center = CGPoint(x: 100, y: i * 21)
            label.textAlignment = .left
            label.text = history[i]
            self.UIScroll.addSubview(label)
        }
        
        UIScroll.contentSize = CGSize(width: 200, height: history.count * 21)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet var historyLabel: [UIScrollView]!
        
}

