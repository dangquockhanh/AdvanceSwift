//
//  CollectionViewCell.swift
//  AdvanceSwift
//
//  Created by Đặng Khánh  on 6/3/20.
//  Copyright © 2020 Đặng Khánh . All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    var flip = true
    var back: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleLongTap(sender:)))
        
        self.addGestureRecognizer(tap)
        self.isUserInteractionEnabled = true
        createdView()
    }

    @objc func handleLongTap(sender: UITapGestureRecognizer) {
        if flip {
            contentView.addSubview(back)
            UIView.transition(from: contentView, to: back, duration: 1, options: UIView.AnimationOptions.transitionFlipFromLeft, completion: nil)
            flip = false
        } else {
            UIView.transition(from: back, to: contentView, duration: 1, options: UIView.AnimationOptions.transitionFlipFromLeft, completion: nil)
            flip = true
        }
    }
    
    func createdView() {
        back = UIImageView(frame: self.frame)
        back.contentMode = .scaleAspectFit
    }

}
