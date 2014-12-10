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
    
    func getEmptyPosition() -> (row: Int, column: Int) {
        
        for row in 0 ..< CELL_COUNT {
            for column in 0 ..< CELL_COUNT {
                let cell = mat[row][column]
                if !cell.isFixed {
                    
                    self.erasePossibility(row, column)
                    return (row, column)
                }
            }
        }
        
        return (-1, -1)
    }
    
    func erasePossibility(row: Int, _ column: Int) {
        // row
        
        // column
        
        // box
    }
    
}
