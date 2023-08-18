//
//  ListViewController.swift
//  FinalProjectMarkup
//
//  Created by Wesley Franks on 4/23/23.
//

import UIKit
import Firebase

class ListViewController: UIViewController {
    
    //UI Elements
    @IBOutlet weak var ItemList: UITableView!
    @IBOutlet weak var Item: UITextField!
    @IBOutlet weak var Price: UITextField!
    @IBOutlet weak var TableViewResultMessage: UILabel!
    
    struct k{
        static let cellIdentifier = "ReusableCell"
        static let cellNibName = "ItemCell"
    }
    //List Generation Array, GOAL was to be able to have the user enter their own Items/List
   var items: [Items] = [
        Items(sender: "Toilet Paper", body: " Toilet Paper:   $7.89"),
       Items(sender: "Water", body: "Water:   $5.56"),
       Items(sender: "Sand Bags", body: "Sand Bags:   $12.34"),
        Items(sender: "Granola Bars", body: "Granola Bars:   $8.99"),
        Items(sender: "Flashlights", body: "Flashlights: $16.78"),
        Items(sender: "Tooth Paste", body: "Tooth Paste: $6.79")
        
     ]

    override func viewDidLoad() {
        super.viewDidLoad()
        ItemList.dataSource = self
        
        
        //Registered Nib name to store and maintain the new Xib file design for the cells
        ItemList.register(UINib(nibName: k.cellNibName, bundle: nil), forCellReuseIdentifier: k.cellIdentifier )
        
        
    }
    
    

    //Resetting the Input fields for Item and Price
    @IBAction func ClearItemandPrice(_ sender: UIButton) {
        
        Item.text=""
        Price.text=""
        
    }
    
    @IBAction func AddItems(_ sender: UIButton) {
        
        
        let itemBody = Item.text
        let messageSender = Price.text
        
        //Data Validation
        if Item.text?.isEmpty ?? true {
            TableViewResultMessage.text = "Please enter a valid Item Name!"
            return
        }
        //Input Validation for PassWord
        if   Price.text?.isEmpty ?? true {
            TableViewResultMessage.text = "Please enter a valid Price"
            return
        }
        
        
    }
    
    
}
//Neccessary Code required to activate Cells within a table view.
extension ListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: k.cellIdentifier, for: indexPath)
        as! ItemCell
        cell.label.text = items[indexPath.row].body
        return cell
    }
    
    //THIS IS WHAT WE WANT BY WHY AR WE GETTING A CANNOT ASSIGN ERROR. THIS IS WHAT WE NEED
  /* func tableView( tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       let alertController = UIAlertController(title: "Price List", message: nil, preferredStyle: .alert)
       alertController.addTextField()
       
       let submit = UIAlertAction(title: "Change", style: .default) { (alert) in
           if let textField = alertController.textFields?.first {
               self.items[indexPath.row] = textField.text ?? "No Item"
               self.tableView.reloadData()
           }
       }
       
       alertController.addAction(submit)
       
       self.present(alertController, animated: true, completion: nil)
    }
    
    */
    
}

