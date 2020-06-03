//
//  Extension.swift
//  AdvanceSwift
//
//  Created by Đặng Khánh  on 6/3/20.
//  Copyright © 2020 Đặng Khánh . All rights reserved.
//

import UIKit

extension UIView {
  func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
}
