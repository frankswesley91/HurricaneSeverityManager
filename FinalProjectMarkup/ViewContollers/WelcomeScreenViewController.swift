//
//  WelcomeScreenViewController.swift
//  FinalProjectMarkup
//
//  Created by Wesley Franks on 4/23/23.
//

import UIKit
import Firebase

class WelcomeScreenViewController: UIViewController {

    @IBOutlet weak var IPrepareLogo: UILabel!
    
    @IBOutlet weak var LoginEmail: UITextField!
    
    @IBOutlet weak var WelcomeResultMessage: UILabel!
    
    @IBOutlet weak var LoginPassword: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        IPrepareLogo.text = ""
        var charIndex = 0.0
        let titleText = "IPrepare"
        for letter in titleText {
            print("-")
            print(0.1*charIndex)
            print(letter)
            Timer.scheduledTimer(withTimeInterval: 0.1 * charIndex, repeats: false) { timer in
                self.IPrepareLogo.text?.append(letter)
            }
            charIndex += 1
        }
    }
    
    
    @IBAction func Login(_ sender: UIButton) {
        //Does this work?
        
        if LoginEmail.text?.isEmpty ?? true {
            WelcomeResultMessage.text = "Please enter a valid email or create an account!"
            return
        }
        //Input Validation for PassWord
        if LoginPassword.text?.isEmpty ?? true {
            WelcomeResultMessage.text = "Please enter a valid password or create an account!"
            return
        }
        
        //Login Firebase Database Authentication
        if let email = LoginEmail.text, let password = LoginPassword.text {
            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                if let e = error {
                    print(e)
                    
                    
                } else {
                    
                    //Dont want the segue, I have a button already for that reason?
                    //self.performSegue(withIdentifier: "WelcomeScreenToDisasterEval", sender: self)
                }
            }
        }
        
        
        
    }
    
    }
    

