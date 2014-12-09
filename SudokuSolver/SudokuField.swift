//
//  SudokuField.swift
//  SudokuSolver
//
//  Created by Ken Tominaga on 12/10/14.
//  Copyright (c) 2014 Ken Tominaga. All rights reserved.
//

import UIKit

class SudokuField: UIView {
    var mat: [[[UInt8]]] = Array(count: 9, repeatedValue: Array(count: 9, repeatedValue: Array(count: 9, repeatedValue: 0b0)))
    // var mat: [[UInt]] = Array(count: 9, repeatedValue: Array(count: 9, repeatedValue: 0b000_000_000))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let size = frame.size.width / 9 // equals to frame.size.height / 9
        
        mat[0][0] = [1, 0, 0, 0, 0, 0, 0, 0, 0]
        
        for i in 0 ..< 9 {
            for j in 0 ..< 9 {
                println(isFixed(mat[i][j]))
                let label = UILabel(frame: CGRectMake(frame.origin.x + size * CGFloat(j), frame.origin.y + size * CGFloat(i), size, size))
                label.text = "\(mat[i][j])"
                label.textAlignment = NSTextAlignment.Center
                label.textColor = UIColor.blackColor()
                self.addSubview(label)
            }
        }
    }
    
    func isFixed(candidates: [UInt8]) -> Bool {
        return sum(candidates) == 1
    }
    
    func sum(cantidates: [UInt8]) -> UInt8 {
        var total: UInt8 = 0
        for x in cantidates {
            total += x
        }
        return total
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
