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
    
    var candidates: [UInt8] = Array<UInt8>(count: 9, repeatedValue: 1) {
        didSet {
            self.text = self.number != nil ? "\(self.number!)" : ""
            
            self.backgroundColor = self.isFixed ? UIColor.whiteColor() : UIColor(white: 0.8, alpha: 1.0)
        }
    }
    
    var isFixed :Bool {
        get {
            var total: UInt8 = 0
            for x in candidates {
                total += x
            }
            
            return total == 1
        }
    }
    
    var number: UInt8? {
        get {
            var index: UInt8 = 0
            
            if self.isFixed {
                for i in 0 ..< CELL_COUNT {
                    if candidates[i] == 1 {
                        index = UInt8(i)
                        break
                    }
                }
                
                return UInt8(index + 1)
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
    
}
