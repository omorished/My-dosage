

import UIKit



class FoodCell: UITableViewCell{

  
    //UI Connection
    @IBOutlet weak var foodNameLbl: UILabel!
    @IBOutlet weak var amountUnitLbl: UILabel!
    @IBOutlet weak var amountTxtField: UITextField!
    @IBOutlet weak var carbLbl: UILabel!
    @IBOutlet weak var checkboxBtn: UIButton!
    
    func setFood(food: Food) {
        foodNameLbl.text = food.foodName
        amountUnitLbl.text = food.amountUnit
    }
    
    
    
}

