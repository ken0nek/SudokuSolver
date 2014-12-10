//
//  Manager.swift
//  SudokuSolver
//
//  Created by Ken Tominaga on 12/10/14.
//  Copyright (c) 2014 Ken Tominaga. All rights reserved.
//

import UIKit

class Manager: NSObject {
    
    class var sharedInstance : Manager {
        struct Static {
            static let instance : Manager = Manager()
        }
        return Static.instance
    }
    
    func solve(field: Field) {
        while !field.isFinished {
            println("continue")
            let (row, column) = field.getEmptyPosition()
            
        }
        
        println("solved!")
    }
}
