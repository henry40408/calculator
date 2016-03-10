//
//  DisplayLabel.swift
//  Calculator
//
//  Created by sodas on 2/28/16.
//  Copyright © 2016 sodas. All rights reserved.
//

import UIKit

class DisplayLabel: UILabel {
    
    var decimalDotted = false

    // MARK: - Value

    var floatValue: Float {
        get {
            if let text = self.text {
                return Float(text)!
            } else {
                return 0.0
            }
        }
        set(newValue) {
            self.text = (newValue as NSNumber).stringValue
        }
    }

    func clear() {
        self.floatValue = 0.0
        self.decimalDotted = false
    }

    func append(digit: Int) {
        if let text = self.text where text != "0" {
            self.text = text + "\(digit)"
        } else {
            self.text = (digit as NSNumber).stringValue
        }
    }

    // MARK: - Negative

    var negative: Bool {
        if let text = self.text {
            return text.hasPrefix("-")
        } else {
            return false
        }
    }

    var pureZero: Bool {
        if let text = self.text {
            return text == "0" || text == "0.0"
        } else {
            return false
        }
    }

    func changeSign() {
        guard let text = self.text else {
            return
        }
        if self.pureZero {
            return
        }
        self.text = self.negative ? text.substringFromIndex(text.startIndex.advancedBy(1)) : "-" + text
    }
    
    func addDecimalDot() {
        if !self.decimalDotted {
            self.text = self.text! + "."
            self.decimalDotted = true
        }
    }

}
