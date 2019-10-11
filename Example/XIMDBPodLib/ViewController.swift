//
//  ViewController.swift
//  XIMDBPodLib
//
//  Created by xiaofengmin on 10/09/2019.
//  Copyright (c) 2019 xiaofengmin. All rights reserved.
//

import UIKit
//import XIMDBPodLib
//import XIMDBPodLib

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        DBPool.init()
//        BLog()
//        CLog()
        let sc = StockCenter.init()
        sc.insertDemo()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

