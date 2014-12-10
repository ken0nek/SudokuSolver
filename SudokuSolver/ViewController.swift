//
//  ViewController.swift
//  SudokuSolver
//
//  Created by Ken Tominaga on 12/10/14.
//  Copyright (c) 2014 Ken Tominaga. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var field: Field!
    let manager: Manager = Manager.sharedInstance
    //        let numbers: [[Int]] = // template
    //        [
    //            [0, 0, 0, 0, 0, 0, 0, 0, 0],
    //            [0, 0, 0, 0, 0, 0, 0, 0, 0],
    //            [0, 0, 0, 0, 0, 0, 0, 0, 0],
    //            [0, 0, 0, 0, 0, 0, 0, 0, 0],
    //            [0, 0, 0, 0, 0, 0, 0, 0, 0],
    //            [0, 0, 0, 0, 0, 0, 0, 0, 0],
    //            [0, 0, 0, 0, 0, 0, 0, 0, 0],
    //            [0, 0, 0, 0, 0, 0, 0, 0, 0],
    //            [0, 0, 0, 0, 0, 0, 0, 0, 0]
    //        ]
    
    let numbers: [[Int]] = // beginner
    [
        [0, 3, 8, 0, 5, 0, 0, 0, 0],
        [9, 0, 4, 6, 0, 1, 0, 7, 2],
        [0, 0, 0, 7, 0, 8, 0, 0, 0],
        [0, 0, 0, 0, 1, 0, 5, 0, 0],
        [0, 4, 1, 9, 0, 0, 7, 0, 3],
        [8, 9, 5, 3, 7, 2, 0, 0, 6],
        [2, 8, 0, 1, 6, 0, 0, 5, 4],
        [0, 6, 7, 5, 0, 3, 9, 0, 1],
        [0, 0, 3, 8, 4, 9, 2, 6, 0]
    ]
    
    //        let numbers: [[Int]] = // middle
    //        [
    //            [0, 4, 0, 2, 0, 7, 0, 0, 0],
    //            [0, 0, 0, 0, 0, 0, 0, 0, 8],
    //            [3, 0, 0, 0, 0, 0, 1, 0, 9],
    //            [0, 0, 0, 0, 0, 9, 0, 0, 0],
    //            [0, 6, 0, 0, 0, 0, 0, 2, 0],
    //            [0, 0, 0, 0, 1, 0, 0, 0, 0],
    //            [8, 5, 0, 6, 0, 0, 0, 0, 0],
    //            [0, 0, 0, 4, 0, 0, 0, 6, 0],
    //            [9, 0, 0, 0, 0, 0, 0, 0, 0]
    //        ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        field = Field(center: CGPointMake(160, 284), numbers: numbers)
        self.view.addSubview(field)
    }
    
    @IBAction func start() {
        manager.solve(field)
    }
    
    @IBAction func reset() {
        manager.reset(field)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

