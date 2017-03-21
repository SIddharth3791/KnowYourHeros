//
//  SignUpViewController.swift
//  KnowYourHero
//
//  Created by Siddharth Patel on 3/17/17.
//  Copyright © 2017 Siddharth Patel. All rights reserved.
//
import UIKit
import Firebase
import FirebaseAuth

class SignUpViewController: UIViewController {

    //Marks:- Center Constraints
    @IBOutlet weak var emailConstraint: NSLayoutConstraint!
    @IBOutlet weak var passwordConstraint: NSLayoutConstraint!
    @IBOutlet weak var signupConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var  CreateAccountButton: CustomeButton!
    
    @IBOutlet weak var EmailTextField: CustomTextField!
    
    @IBOutlet weak var PasswordTextField: CustomTextField!
    
    
    var animEngine: AnimatioEngine!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.animEngine = AnimatioEngine(constraints: [emailConstraint, passwordConstraint, signupConstraint])
        
        NotificationCenter.default.addObserver(self, selector: #selector( SignUpViewController.keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(SignUpViewController.keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool)
    {
        self.animEngine.animateOnScreen(1/2)
    }
    
    
    @IBAction func CreateAccountButtonPressed(_ sender: Any) {
        
        var username = EmailTextField.text!
        if EmailTextField.text == ""{
            let alertController = UIAlertController(title: "Error", message: "Please Enter Your Email and Password", preferredStyle: .alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            
            present(alertController, animated: true, completion:  nil)
        }else
        {
            
            FIRAuth.auth()?.createUser(withEmail: username + "@gmail.com", password: PasswordTextField.text!) { (user, error) in
                
                if error == nil {
                    print("You have successfully signed up")
                    
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "Home")
                    self.present(vc!, animated: true, completion: nil)
                    
                } else {
                    let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                    
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)
                    
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }

    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func keyboardWillShow(notification: NSNotification) {
        
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0{
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
        
    }
    
    func keyboardWillHide(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y != 0{
                self.view.frame.origin.y += keyboardSize.height
            }
        }
    }
    
    

}
   

