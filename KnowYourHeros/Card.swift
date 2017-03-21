//
//  Card.swift
//  KnowYourHero
//
//  Created by Siddharth Patel on 3/16/17.
//  Copyright © 2017 Siddharth Patel. All rights reserved.
//

import UIKit

class Card: UIView {

        let heros = ["Batman", "Superman", "WonderWoman", "GreenLantern", "Aquaman"]
    
    var CurrentHero: String!
    
    @IBOutlet weak var heroImage: UIImageView!
    
    @IBInspectable var cornerRadius: CGFloat = 4.0{
        didSet{
            setUpView()
        }
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setUpView()
    }
    
    override func awakeFromNib() {
        setUpView()
        selectShape()
    }
    
 
    func setUpView()
    {
        self.layer.cornerRadius = cornerRadius
        self.layer.shadowOpacity = 0.8
        self.layer.shadowRadius = 5.0
        self.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        self.layer.shadowColor = UIColor(red: 157.0/255.0, green: 157.0/255.0, blue: 157.0/255.0, alpha: 1.0).cgColor
        self.setNeedsLayout()
    }

    
    func selectShape()
    {
        CurrentHero = heros[Int(arc4random_uniform(5))]
        heroImage.image = UIImage(named: CurrentHero)
    }
}
