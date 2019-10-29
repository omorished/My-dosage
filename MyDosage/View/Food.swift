

import Foundation

enum FoodType: String{
    case protein = "protein"
    case milkAndDairy = "milkAndDairy"
    case veg = "veg"
    case fruit = "fruit"
    case carbo = "carbo"
}
class Food{
    
    var foodType: FoodType
    var foodName: String
    var carb: String = ""
    var amountUnit: String
    var amount: String = ""
    var checked: Bool = false
    var numberInArray: Int = 0
    
    init(foodType: FoodType, foodName: String, amountUnit: String, numberInArray: Int, carb: String) {
        
        self.foodType = foodType
        self.foodName = foodName
        self.amountUnit = amountUnit
        self.numberInArray = numberInArray
        self.carb = carb
    }
    
}

