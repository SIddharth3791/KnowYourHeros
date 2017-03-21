//
//  ViewController.swift
//  KnowYourHeros
//
//  Created by Siddharth Patel on 3/20/17.
//  Copyright © 2017 Siddharth Patel. All rights reserved.
//

import UIKit
import pop
import Firebase
import FirebaseAuth

class LoginViewController: UIViewController {

    @IBOutlet weak var emailConstraint: NSLayoutConstraint!
    @IBOutlet weak var passwordConstraint: NSLayoutConstraint!
    @IBOutlet weak var loginConstraint: NSLayoutConstraint!
    @IBOutlet weak var signupConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var userNameText: CustomTextField!
    @IBOutlet weak var passWordText: CustomTextField!
    
    
    var animEngine: AnimatioEngine!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.animEngine = AnimatioEngine(constraints: [emailConstraint, passwordConstraint,loginConstraint, signupConstraint])
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func viewDidAppear(_ animated: Bool)
    {
        self.animEngine.animateOnScreen(1/2)
    }
    
    @IBAction func loginAction(_ sender: AnyObject) {
        
       let username = userNameText.text!
        
        if self.userNameText.text == "" || self.passWordText.text == "" {
            
            //Alert to tell the user that there was an error because they didn't fill anything in the textfields because they didn't fill anything in
            
            let alertController = UIAlertController(title: "Error", message: "Please enter an email and password.", preferredStyle: .alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            
            self.present(alertController, animated: true, completion: nil)
            
        } else {
            
            FIRAuth.auth()?.signIn(withEmail: username + "@gmail.com", password: self.passWordText.text!) { (user, error) in
                
                if error == nil {
                    
                    //Print into the console if successfully logged in
                    print("You have successfully logged in")
                    
                       //Go to the HomeViewController if the login is sucessful
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "Home")
                    self.present(vc!, animated: true, completion: nil)
                    
                } else {
                    
                    //Tells the user that there is an error and then gets firebase to tell them the error
                    let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                    
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)
                    
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }
    }
}



