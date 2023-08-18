//
//  LoginViewController.swift
//  FinalProjectMarkup
//
//  Created by Wesley Franks on 4/23/23.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    
    @IBOutlet weak var CreateEmail: UITextField!
    
    
    @IBOutlet weak var CreatePassword: UITextField!
    
    
    @IBOutlet weak var IsEmailNotifications: UISwitch!
    
    
    @IBOutlet weak var EmailNotificationsResult: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        IsEmailNotifications.isOn = false
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func SignUp(_ sender: Any) {
        
        if IsEmailNotifications.isOn == true
        {
            EmailNotificationsResult.text = "You have succesfully signed up for IPrepare, an email confirmation has been sent! Look out for future emails with up to date news and information regarding major storms in your area!"
        } else
        {
            EmailNotificationsResult.text = "You have succesfully signed up for IPrepared!"
        }
        
        if let email = CreateEmail.text, let password = CreatePassword.text {
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                if let e = error{
                    print(e)
                    
                } else{
                    //Dont want segue
                   // self.performSegue(withIdentifier: "LoginToDisasterEval", sender: self)
                }
                
            }
        }
    }
    

    

}
