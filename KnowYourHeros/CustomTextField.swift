//
//  CustomTextField.swift
//  KnowYourHero
//
//  Created by Siddharth Patel on 3/16/17.
//  Copyright © 2017 Siddharth Patel. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class CustomTextField: UITextField {
    
    @IBInspectable var inset: CGFloat = 0;
    
    @IBInspectable var cornerRadius: CGFloat = 8.0{
        didSet{
            setupView()
        }
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: inset, dy: inset)
    
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        
        return textRect(forBounds: bounds)
    }
    
    override func awakeFromNib() {
        self.layer.cornerRadius = 8.0
    }
    
    override func prepareForInterfaceBuilder()
    {
        super.prepareForInterfaceBuilder()
        setupView()
    }
    
    func setupView()
    {
        self.layer.cornerRadius = cornerRadius
    }
}
