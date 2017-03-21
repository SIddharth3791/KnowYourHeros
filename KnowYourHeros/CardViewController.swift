//
//  CardViewController.swift
//  KnowYourHero
//
//  Created by Siddharth Patel on 3/16/17.
//  Copyright © 2017 Siddharth Patel. All rights reserved.
//

import UIKit
import pop

class CardViewController: UIViewController {

    @IBOutlet weak var yesBtn: CustomeButton!
    @IBOutlet weak var noBtn: CustomeButton!
    @IBOutlet weak var titleLbl: UILabel!
    

    
    var currentCard: Card!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        currentCard = createCardFromNib()
        currentCard.center = AnimatioEngine.screenCenterPosition
        self.view.addSubview(currentCard)
    }
    
    @IBAction func yesPressed(_ sender: UIButton) {
        if sender.titleLabel?.text == "YES" {
            checkAnswer()
        } else {
            titleLbl.text = "Does this card match the previous?"
        }
        
        showNextCard()
    }
    
    @IBAction func noPressed(_ sender: AnyObject) {
        checkAnswer()
        showNextCard()
    }
    
    func showNextCard() {
        
        if let current = currentCard {
            let cardToRemove = current
            currentCard = nil
            
            AnimatioEngine.animateToPosition(cardToRemove, position: AnimatioEngine.offScreenLeftPosition, completion: { (anim: POPAnimation?, finished: Bool) -> Void in
                cardToRemove.removeFromSuperview()
            })
            
        }
        
        if let next = createCardFromNib() {
            next.center = AnimatioEngine.offScreenRightPosition
            self.view.addSubview(next)
            currentCard = next
            
            if noBtn.isHidden {
                noBtn.isHidden = false

                yesBtn.setTitle("YES", for: UIControlState())
            }
            
            AnimatioEngine.animateToPosition(next, position: AnimatioEngine.screenCenterPosition, completion: { (anim: POPAnimation?, finished: Bool) -> Void in
                
            })
            
        }
        
        
    }
    
    func createCardFromNib() -> Card? {
        return Bundle.main.loadNibNamed("Card", owner: self, options: nil)?[0] as? Card
    }
    
    func checkAnswer() {
        
    }
    
    
}

