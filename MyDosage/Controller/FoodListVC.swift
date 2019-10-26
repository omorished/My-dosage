//


import UIKit

class FoodListVC: UIViewController {
    
    //
    @IBOutlet weak var foodTableView: UITableView!
    
    //food object (declare)
    var foodDB = FoodDB()
    //
    var category: String = ""
    var tagNumber: Int = 0
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //
        foodTableView.delegate = self
        foodTableView.dataSource = self
        
        
           //tap gesture
             let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
             
              view.addGestureRecognizer(tap)
        
   
    }
    
   //when checkbox clicked
    @IBAction func checkboxClicked(_ sender: UIButton) {
        dismissKeyboard()
            print(FoodDB.getProperList(passTagNum: tagNumber)[sender.tag].checked )
        if FoodDB.getProperList(passTagNum: tagNumber)[sender.tag].checked {
            sender.setTitle("اضافة", for: .normal)
            sender.setTitleColor(.blue, for: .normal)
            //to uncheck on original food list
            FoodDB.checkOrUncheckOnOriginalList(food: FoodDB.getProperList(passTagNum: tagNumber)[sender.tag], isChecked: false)
            //to remove from the basket
            FoodDB.removeFromBasket(food: FoodDB.getProperList(passTagNum: tagNumber)[sender.tag])
            //
            print("removed: \(FoodDB.foodBasket.count)")
            
        } else {
            sender.setTitle("حذف", for: .normal)
            sender.setTitleColor(.red, for: .normal)
            //to check on original food list
            FoodDB.checkOrUncheckOnOriginalList(food: FoodDB.getProperList(passTagNum: tagNumber)[sender.tag], isChecked: true)
            //to add in the basket
            FoodDB.addToBasket(food: FoodDB.getProperList(passTagNum: tagNumber)[sender.tag])
            //
            print("added: \(FoodDB.foodBasket.count)")
        }
        
       
    }
    
    //to dismiss the keyboard whenever click everywhere in the blank view
       @objc func dismissKeyboard() {
                view.endEditing(true)
           }

}

    

extension FoodListVC: UITableViewDelegate, UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return FoodDB.getProperList(passTagNum: tagNumber).count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let food = FoodDB.getProperList(passTagNum: tagNumber)[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "foodCell") as! FoodCell
        
        //configurtion
        cell.setFood(food: food)
        cell.checkboxBtn.tag = indexPath.row
        
        
        // to check if selected
        if FoodDB.getProperList(passTagNum: tagNumber)[indexPath.row].checked {
            cell.checkboxBtn.setTitle("حذف", for: .normal)
            cell.checkboxBtn.setTitleColor(.red, for: .normal)
            
        } else {
            cell.checkboxBtn.setTitle("اضافة", for: .normal)
            cell.checkboxBtn.setTitleColor(.blue, for: .normal)
        }
        
        
        //to make it unselectable
        cell.selectionStyle = .none
        
        
        
        return cell
    }
    
    
    
}


