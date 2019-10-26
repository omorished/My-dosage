



import UIKit

class TestVC: UIViewController {

    var foodDB: FoodDB = FoodDB()
    override func viewDidLoad() {
        super.viewDidLoad()
        print(FoodDB.getProperList(passTagNum: 0)[0].checked)
        
        print("let's see: \(FoodDB.foodBasket.count)")

        
    }
    


}
