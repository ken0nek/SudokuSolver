//
//  Cell.swift
//  SudokuSolver
//
//  Created by Ken Tominaga on 12/10/14.
//  Copyright (c) 2014 Ken Tominaga. All rights reserved.
//

import UIKit

class Cell: UILabel {
    
    var row: Int = -1
    var column: Int = -1
    
    var candidates: [Int] = Array<Int>(count: 9, repeatedValue: 1) {
        didSet {
            update()
        }
    }
    
    // number of candidates
    var rest: Int {
        get {
            return numbers.count
        }
    }
    
    // possible numbers
    var numbers: [Int] {
        var nums: [Int] = []
        for x in 0 ..<
            CELL_COUNT {
            if candidates[x] == 1 {
                nums.append(x+1)
            }
        }
        
        return nums
    }
    
    // whether the cell is filled
    var isFixed :Bool {
        get {
            return rest == 1
        }
    }
    
    // number that cell shows
    var number: Int? {
        get {
            if self.isFixed {
                return numbers[0]
            } else {
                return nil
            }
        }
    }
    
    override init() {
        super.init()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.textAlignment = NSTextAlignment.Center
        self.textColor = UIColor.blackColor()
        
        self.layer.borderColor = UIColor.blueColor().CGColor
        self.layer.borderWidth = 1.0
    }
    
    convenience init(row: Int, column: Int) {
        self.init(frame: CGRectMake(CELL_SIZE * CGFloat(column), CELL_SIZE * CGFloat(row), CELL_SIZE, CELL_SIZE))
        self.row = row
        self.column = column
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update() {
        self.text = self.isFixed ? "\(self.number!)" : ""
        self.backgroundColor = self.isFixed ? UIColor.whiteColor() : UIColor(white: 0.8, alpha: 1.0)
    }
}
