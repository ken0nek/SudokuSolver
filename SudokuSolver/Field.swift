//
//  Field.swift
//  SudokuSolver
//
//  Created by Ken Tominaga on 12/10/14.
//  Copyright (c) 2014 Ken Tominaga. All rights reserved.
//

import UIKit

let CELL_SIZE: CGFloat = 34

class Field: UIView {
    var mat: [[Cell]] = Array(count: 9, repeatedValue: Array(count: 9, repeatedValue: Cell()))
    
    init(center: CGPoint, numbers: [[Int]]) {
        super.init(frame: CGRectMake(0, 0, CELL_SIZE * 9, CELL_SIZE * 9))
        self.center = center
        
        for i in 0 ..< 9 {
            for j in 0 ..< 9 {
                var cell = mat[i][j] as Cell
                cell = Cell(row: i, column: j)
                cell.candidates = put(numbers[i][j])
                self.addSubview(cell)
            }
        }
    }

    func put(number: Int) -> [UInt8] {
        var array: [UInt8] = Array(count: 9, repeatedValue: 0b0)
        
        if number > 0 {
            array[number - 1] = 1
        }
        
        return array
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
