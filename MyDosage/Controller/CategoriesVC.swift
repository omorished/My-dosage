

import UIKit

class CategoriesVC: UIViewController {
    
    
    //UI Connection
    @IBOutlet weak var proteinBtn: CategoryUIButton!
    @IBOutlet weak var milkAndDairy: CategoryUIButton!
    @IBOutlet weak var vegBtn: CategoryUIButton!
    @IBOutlet weak var fruitBtn: CategoryUIButton!
    @IBOutlet weak var carboBtn: CategoryUIButton!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
    //to make button circle
    proteinBtn.layer.cornerRadius = proteinBtn.frame.size.width / 2

    milkAndDairy.layer.cornerRadius = milkAndDairy.frame.size.width / 2

    vegBtn.layer.cornerRadius = vegBtn.frame.size.width / 2
        
    milkAndDairy.layer.cornerRadius = milkAndDairy.frame.size.width / 2
        
    fruitBtn.layer.cornerRadius = fruitBtn.frame.size.width / 2
        
    carboBtn.layer.cornerRadius = carboBtn.frame.size.width / 2
    
        
    //tap gesture
         let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
         
          view.addGestureRecognizer(tap)
        
        

        }
    
    //to dismiss the keyboard whenever click everywhere in the blank view
    @objc func dismissKeyboard() {
    
            view.endEditing(true)
        }


}
