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
        
        let start = NSDate()
        
        while !field.isFinished {
            println("continue")
            self.scan(field)
        }
        
        let end = NSDate()
        
        println("solved! in \(end.timeIntervalSinceDate(start)) seconds")
    }
    
    func reset(field: Field) {
        for row in 0 ..< CELL_COUNT {
            for column in 0 ..< CELL_COUNT {
                let cell = field.mat[row][column]
                cell.candidates = field.put(field.numbers[row][column])
                field.mat[row][column] = cell
            }
        }
    }
    
    func scan(field: Field) {
        for row in 0 ..< CELL_COUNT {
            for column in 0 ..< CELL_COUNT {
                let cell = field.mat[row][column]
                if !cell.isFixed {
                    if !field.check(row, column) {
                        try(row, column, field)
                    }
                    NSRunLoop.currentRunLoop().runUntilDate(NSDate(timeIntervalSinceNow: 0.05))
                }
            }
        }
    }
    
    func try(row: Int, _ column: Int, _ field: Field) {
        let cell = field.mat[row][column]
        for k in 0 ..< CELL_COUNT {
            
        }
    }
}
