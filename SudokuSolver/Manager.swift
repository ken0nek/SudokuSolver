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
            for row in 0 ..< CELL_COUNT {
                for column in 0 ..< CELL_COUNT {
                    let cell = field.mat[row][column]
                    if !cell.isFixed {
                        field.check(row, column)
                        NSRunLoop.currentRunLoop().runUntilDate(NSDate(timeIntervalSinceNow: 0.05))
                    }
                }
            }
        }
        
        println("solved!")
    }
}
