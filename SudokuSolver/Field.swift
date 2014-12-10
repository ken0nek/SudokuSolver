//
//  Field.swift
//  SudokuSolver
//
//  Created by Ken Tominaga on 12/10/14.
//  Copyright (c) 2014 Ken Tominaga. All rights reserved.
//

import UIKit

let CELL_SIZE: CGFloat = 34
let CELL_COUNT: Int = 9
let FIELD_SIZE: CGFloat = CELL_SIZE * CGFloat(CELL_COUNT)

class Field: UIView {
    var mat: [[Cell]] = Array(count: CELL_COUNT, repeatedValue: [Cell](count: CELL_COUNT, repeatedValue: Cell()))
    
    var isFinished: Bool {
        get {
            
            for row in 0 ..< CELL_COUNT {
                for column in 0 ..< CELL_COUNT {
                    if !self.mat[row][column].isFixed {
                        return false
                    }
                }
            }
            
            return true
        }
    }
    
    init(center: CGPoint, numbers: [[Int]]) {
        super.init(frame: CGRectMake(0, 0, CELL_SIZE * 9, CELL_SIZE * 9))
        self.center = center
        
        for row in 0 ..< CELL_COUNT {
            for column in 0 ..< CELL_COUNT {
                let cell = Cell(row: row, column: column)
                cell.candidates = put(numbers[row][column])
            
                mat[row][column] = cell
                self.addSubview(cell)
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    override init () {
        super.init()
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func put(number: Int) -> [UInt8] {
        if number > 0 {
            var array: [UInt8] = [UInt8](count: CELL_COUNT, repeatedValue: 0)
            array[number - 1] = 1
            
            return array
        } else {
            return [UInt8](count: CELL_COUNT, repeatedValue: 1)
        }
    }
    
    func check(row: Int, _ column: Int) {
        let cell = self.mat[row][column]
        cell.backgroundColor = UIColor(red: 1, green: 0, blue: 0, alpha: 0.8)
        NSRunLoop.currentRunLoop().runUntilDate(NSDate(timeIntervalSinceNow: 0.05))
        
        println("start check \(row), \(column), \(cell.candidates)")
        
        // box
        self.checkBox(cell)
        
        // row
        self.checkRow(cell)
        
        // column
        self.checkColumn(cell)
        
        println("end check \(row), \(column), \(cell.candidates), \(cell.rest)")
        
        self.printField()
    }
    
    func checkBox(cell: Cell) {
        println("start check box")
        if !cell.isFixed {
            let rBase = (cell.row / 3) * 3
            let cBase = (cell.column / 3) * 3
            for r in rBase ..< rBase + 3 {
                for c in cBase ..< cBase + 3 {
                    if cell.row != r && cell.column != c {
                        if let number = self.mat[r][c].number {
                            println(number)
                            cell.candidates[number - 1] = 0
                        }
                    }
                }
            }
        }
        println("end check box")
    }
    
    func checkRow(cell: Cell) {
        println("start check row")
        if !cell.isFixed {
            for x in 0 ..< CELL_COUNT {
                if x != cell.column {
                    if let number = self.mat[cell.row][x].number {
                        cell.candidates[number - 1] = 0
                    }
                }
            }
        }
        println("end check row")
    }
    
    func checkColumn(cell: Cell) {
        println("start check column")
        if !cell.isFixed {
            for y in 0 ..< CELL_COUNT {
                if y != cell.row {
                    if let number = self.mat[y][cell.column].number {
                        cell.candidates[number - 1] = 0
                    }
                }
            }
        }
        println("end check column")
    }
    
    func printField() {
        for row in 0 ..< CELL_COUNT {
            for column in 0 ..< CELL_COUNT {
                let cell = self.mat[row][column]
                if cell.isFixed {
                    print(" \(cell.number!) ")
                } else {
                    print(" * ")
                }
            }
            println("")
        }
    }

}
