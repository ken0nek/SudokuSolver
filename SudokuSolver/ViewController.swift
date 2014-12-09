//
//  ViewController.swift
//  SudokuSolver
//
//  Created by Ken Tominaga on 12/10/14.
//  Copyright (c) 2014 Ken Tominaga. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let field = SudokuField(frame: CGRectMake(0, 80, 320, 320))
        self.view.addSubview(field)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

