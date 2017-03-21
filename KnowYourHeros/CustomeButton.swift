//
//  CustomeButton.swift
//  KnowYourHero
//
//  Created by Siddharth Patel on 3/16/17.
//  Copyright © 2017 Siddharth Patel. All rights reserved.
//

import Foundation
import UIKit
import pop

@IBDesignable
class  CustomeButton: UIButton {
    
    @IBInspectable var radius: CGFloat = 8.0{
        didSet{
            setupView()
        }
    }
    
    @IBInspectable var fontColor: UIColor = UIColor.white{
        
        didSet{
            self.tintColor = fontColor
        }
    }
    
    override func awakeFromNib() {
        setupView()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setupView()
    }
    
    func setupView() {
        self.layer.cornerRadius = radius
        
        self.addTarget(self, action: #selector(CustomeButton.scaleToSmall), for: .touchDown)
        self.addTarget(self, action: #selector(CustomeButton.scaleToSmall), for: .touchDragEnter)
        self.addTarget(self, action: #selector(CustomeButton.scaleAnimation), for: .touchUpInside)
        self.addTarget(self, action: "scaleToDefault", for: .touchDragExit)
    }
    
    
    func scaleToSmall() {
        let scaleAnim = POPBasicAnimation(propertyNamed: kPOPLayerScaleXY)
        scaleAnim?.toValue = NSValue(cgSize: CGSize(width: 0.95, height: 0.95))
        self.layer.pop_add(scaleAnim, forKey: "layerScaleSmallAnimation")
    }
    
    func scaleAnimation() {
        let scaleAnim = POPSpringAnimation(propertyNamed: kPOPLayerScaleXY)
        scaleAnim?.velocity = NSValue(cgSize: CGSize(width: 3.0, height: 3.0))
        scaleAnim?.toValue = NSValue(cgSize: CGSize(width: 1.0, height: 1.0))
        scaleAnim?.springBounciness = 18
        self.layer.pop_add(scaleAnim, forKey: "layerScaleSpringAnimation")
    }
    
    func scaleDefault() {
        let scaleAnim = POPBasicAnimation(propertyNamed: kPOPLayerScaleXY)
        scaleAnim?.toValue = NSValue(cgSize: CGSize(width: 1, height: 1))
        self.layer.pop_add(scaleAnim, forKey: "layerScaleDefaultAnimation")
    }
    
}
    

