

import UIKit

class CategoriesVC: UIViewController {
    
    
    //UI Connection
    @IBOutlet weak var proteinBtn: CategoryUIButton!
    @IBOutlet weak var milkAndDairyBtn: CategoryUIButton!
    @IBOutlet weak var vegBtn: CategoryUIButton!
    @IBOutlet weak var fruitBtn: CategoryUIButton!
    @IBOutlet weak var carboBtn: CategoryUIButton!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
    //to make button circle
    proteinBtn.layer.cornerRadius = proteinBtn.frame.size.width / 2

    milkAndDairyBtn.layer.cornerRadius = milkAndDairyBtn.frame.size.width / 2

    vegBtn.layer.cornerRadius = vegBtn.frame.size.width / 2
        
    milkAndDairyBtn.layer.cornerRadius = milkAndDairyBtn.frame.size.width / 2
        
    fruitBtn.layer.cornerRadius = fruitBtn.frame.size.width / 2
        
    carboBtn.layer.cornerRadius = carboBtn.frame.size.width / 2
    
        
    //tap gesture
         let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
         
          view.addGestureRecognizer(tap)
        
        

        }
    
    //
    @IBAction func btnClicked(_ sender: CategoryUIButton) {
        
        performSegue(withIdentifier: "goToFoodList", sender: sender)
    }
    

    
    //to dismiss the keyboard whenever click everywhere in the blank view
    @objc func dismissKeyboard() {
    
            view.endEditing(true)
        }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "goToFoodList" {
            if let VC = segue.destination as? FoodListVC {
                let btnPressed = sender as! CategoryUIButton
                VC.tagNumber = btnPressed.tag
            }
        }
    }

}
