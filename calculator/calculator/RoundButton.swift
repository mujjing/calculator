//
//  RoundButton.swift
//  calculator
//
//  Created by 전지훈 on 2021/10/14.
//

import UIKit

@IBDesignable
class RoundButton: UIButton {
    @IBInspectable var isRound:Bool = false {
        didSet {
            if isRound {
                self.layer.cornerRadius = self.frame.height / 2
            }
        }
    }

}
