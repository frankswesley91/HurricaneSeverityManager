//
//  DisasterEvaluationViewController.swift
//  FinalProjectMarkup
//
//  Created by Wesley Franks on 4/23/23.
//

import UIKit
import Firebase

class DisasterEvaluationViewController: UIViewController {
    
    //NEED A WHILE LOOP IDEA?? IN HERE??
    @IBOutlet weak var WindSpeed: UITextField!
    
    @IBOutlet weak var IsEvacuation: UISwitch!
    
    @IBOutlet weak var DisasterImage: UIImageView!
    
    @IBOutlet weak var DisasterLabel: UILabel!
    
    @IBOutlet weak var DangerLevelResult: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        IsEvacuation.isOn = false
        // Do any additional setup after loading the view.
    }
    
//Calculate Severity Button
    @IBAction func CalculateDanger(_ sender: UIButton) {
        
        guard let windSpeed = Int(WindSpeed.text! )
        else{
            DangerLevelResult.text = "Please enter a valid Wind Speed!"
            return
        }
        if IsEvacuation.isOn
        {
            //ThunderStorm Array
            let lightningArray = [#imageLiteral(resourceName: "Lightning 1"), #imageLiteral(resourceName: "Lightning 5"), #imageLiteral(resourceName: "Lightning New?"), #imageLiteral(resourceName: "Lightning 2"), #imageLiteral(resourceName: "Lightning 3"), #imageLiteral(resourceName: "Lightning 4")]
            DisasterImage.animationImages = lightningArray
            DisasterImage.animationDuration = 6.0
            DisasterImage.animationRepeatCount = 4
            DisasterImage.startAnimating()
            
            DisasterLabel.textColor = UIColor.red
        }
        else
        {
            DisasterLabel.textColor = UIColor.white
        }
        //WindSpeed switch block
        switch windSpeed {
        case 74...95:
            DangerLevelResult.text = "The storm heading towards you is a category (1), it will have very dangerous winds and will produce some damage."
        case 96...110:
            DangerLevelResult.text = "The storm heading towards you is a category (2), it will produce extremely dangerous winds and will cause extensive damage."
        case 111...129:
            DangerLevelResult.text = "The storm heading towards you is a category (3), it will cause Devastating damage."
        case 130...156:
            DangerLevelResult.text = "The storm heading towards you is a category (4), catastrophic damage will occur."
        case 157...300:
            DangerLevelResult.text = "The storm heading towards you is a category (5), Unimaginable damage will occur, homes will be demolished. Evacuate if possible immedialty."
        case 0...73:
            DangerLevelResult.text = "The storm is not yet a category 1, you will most likely be just fine."
            
        default:
            DangerLevelResult.text = " "
            
        }
        
         
       
        
        
        
        
        
    }
    
}
