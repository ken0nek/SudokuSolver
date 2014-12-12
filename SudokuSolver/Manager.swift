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
    
    func solve(field: Field) -> Field {
        
        if !field.findBlank().isFinished {
            println("continue")
            let isChanged = self.scan(0, 0, field)

            if !isChanged {
                println("stack!")
                let (row, column) = field.findMinimumCandidates()
                try(row, column, field)
            } else {
                self.solve(field)
            }
        }
        
        return field
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
    
    func scan(var row: Int, var _ column: Int, _ field: Field) -> Bool {
        var isChanged: Bool = false
        
        if row > 8 || column > 8 {
            return true
        }
        
        let cell = field.mat[row][column]
        if !cell.isFixed {
            isChanged |= field.check(row, column)
        }
        
        scan(column > 7 ? ++row : row, column > 7 ? 0 : ++column, field)
        
        return isChanged
    }
    
    func try(var row: Int, var _ column: Int, _ field: Field) {
        let cell = field.mat[row][column]
        
        for k in cell.numbers {
            println("try : put \(k) at \(row), \(column)")
            cell.candidates = field.put(k)
            self.solve(field)
            
            
            // cell.number = nil
            
        }
    }
    
    func try2(field: Field) {
        
        let exField = field
        
        let (row, column, isFinished) = field.findBlank()
        if !isFinished {
            let cell = field.mat[row][column]
            
            for k in cell.numbers {
                if field.isValid(row, column, k) {
                    cell.candidates = field.put(k)
                    self.solve(field)
                    try2(exField)
                }
            }
        } else {
            println("solved")
            println("------------------")
            field.printField()
            println("------------------")
        }
    }
}
