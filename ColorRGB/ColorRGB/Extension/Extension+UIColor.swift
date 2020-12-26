//
//  Extension+UIColor.swift
//  ColorRGB
//
//  Created by Đặng Khánh  on 12/27/20.
//


import Foundation

extension Float {
    func toInt() -> Int? {
        if self > Float(Int.min) && self < Float(Int.max) {
            return Int(self)
        } else {
            return nil
        }
    }
}
