//
//  SudokuField.swift
//  SudokuSolver
//
//  Created by Ken Tominaga on 12/10/14.
//  Copyright (c) 2014 Ken Tominaga. All rights reserved.
//

import UIKit

class SudokuField: UIView {
    var mat: [[[UInt8]]] = Array(count: 9, repeatedValue: Array(count: 9, repeatedValue: Array(count: 9, repeatedValue: 0)))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let size = frame.size.width / 9 // equals to frame.size.height / 9
        
        let numbers: [[Int]] = [[1, 2, 3, 4, 5, 6, 7, 8, 9],
                                [1, 2, 3, 4, 5, 6, 7, 8, 9],
                                [1, 2, 3, 4, 5, 6, 7, 8, 9],
                                [1, 2, 3, 4, 5, 6, 7, 8, 9],
                                [1, 2, 3, 4, 5, 6, 7, 8, 9],
                                [1, 2, 3, 4, 5, 6, 7, 8, 9],
                                [1, 2, 3, 4, 5, 6, 7, 8, 9],
                                [1, 2, 3, 4, 5, 6, 7, 8, 9],
                                [1, 2, 3, 4, 5, 6, 7, 8, 9]]
        
        for i in 0 ..< 9 {
            for j in 0 ..< 9 {
                
                mat[i][j] = put(numbers[i][j])
                
                let label = UILabel(frame: CGRectMake(frame.origin.x + size * CGFloat(j), frame.origin.y + size * CGFloat(i), size, size))
                label.text = show(mat[i][j])
                label.textAlignment = NSTextAlignment.Center
                label.textColor = UIColor.blackColor()

                label.layer.borderColor = UIColor.blueColor().CGColor
                label.layer.borderWidth = 1.0
                
                self.addSubview(label)
            }
        }
    }
    
    func check(candidates: [UInt8]) -> (isFixed: Bool, index: UInt8?) {
        
        var total: UInt8 = 0
        for x in candidates {
            total += x
        }
        
        return (total == 1, getIndex(candidates))
    }
    
    func getIndex(candidates: [UInt8]) -> UInt8? {
        var index: UInt8 = 0
        
        for i in 0 ..< 9 {
            if candidates[i] == 1 {
                index = UInt8(i)
                break
            }
        }
        
        return index
    }
    
    func show(candidates: [UInt8]) -> String {
        let (flag, index) = check(candidates)
        
        if flag {
            return "\(index! + 1)"
        } else {
            return " "
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
