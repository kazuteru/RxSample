//
//  ViewController.swift
//  RxSampleProject
//
//  Created by Kazuki Kobashi on 2018/05/31.
//  Copyright © 2018年 Kazuki Kobashi. All rights reserved.
//

import UIKit
import RxSwift

class ViewController: UIViewController {
    
    @IBOutlet weak var rightTextField: UITextField!
    @IBOutlet weak var leftTextField: UITextField!
    @IBOutlet weak var leftLabel: UILabel!
    @IBOutlet weak var centerLabel: UILabel!
    @IBOutlet weak var rightLabel: UILabel!
    @IBOutlet weak var clearButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

