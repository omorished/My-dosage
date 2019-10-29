//


import UIKit

class FoodListVC: UIViewController {
    
    //
    @IBOutlet weak var foodTableView: UITableView!
    //
    @IBOutlet weak var basketBtn: UIBarButtonItem!
    //



    //
    var category: String = ""
    var tagNumber: Int = 0
    
    //
    
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        //
        foodTableView.reloadData()
        //
        checkIfBasketIsEmptyOfFill()
        // make all food textfields that removed from basket to empty
        
        //set unchecked food to empty ""
        for food in FoodDB.getProperList(passTagNum: tagNumber) {
            if !food.checked && food.amount != "" {
                setTxtFieldEmpty(tag: food.numberInArray)
            }

        }
        
        
        
    }
    
    
    

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
        print("ENTERED METHOD")
        
        if sender.titleLabel?.text == "حذف" {
            print("HI HATHF")
            setTxtFieldEmpty(tag: sender.tag)
        }
        checkIftxtfieldEmptyOrNot(myTxtfield:  getAmountTxtfield(tag: sender.tag))
        
        dismissKeyboard()
    //
        checkIfBasketIsEmptyOfFill()

    }
    
    //
    @IBAction func amountTxtfieldEndEditing(_ sender: UITextField) {
       
        checkIftxtfieldEmptyOrNot(myTxtfield: sender)
    }
    
    //
    @IBAction func amountTxtfieldChanged(_ sender: UITextField) {
        
        if sender.text == "" || sender.text == nil {
            print("WILL BE UNCLACKABLE,,,,,,")
            makeAddBtnUnclickable(tag: sender.tag)
        } else {
            print("WILL BE CLACKABLE:::::::")
            makeAddBtnClickable(tag: sender.tag)
        }
        
    }
    
    

    
    func setTxtFieldEmpty(tag: Int) {
        
    let indexPath = IndexPath(row: tag, section: 0)
        if let cell = foodTableView.cellForRow(at: indexPath) as! FoodCell? {
            cell.amountTxtField.text = ""
        }
        
    }
    
    func makeAddBtnUnclickable(tag: Int) {
        
        let indexPath = IndexPath(row: tag, section: 0)
        let cell = foodTableView.cellForRow(at: indexPath) as! FoodCell
        cell.checkboxBtn.isEnabled = false
               
        
    }
    
    func makeAddBtnClickable(tag: Int) {
        
        let indexPath = IndexPath(row: tag, section: 0)
        let cell = foodTableView.cellForRow(at: indexPath) as! FoodCell
        cell.checkboxBtn.isEnabled = true
    }
    
    // if I can't pass button, if it is this call this method
    func prepareForChangeDeleteBtnToAddBtn(tag: Int) {

        let indexPath = IndexPath(row: tag, section: 0)
        if let cell = foodTableView.cellForRow(at: indexPath) as! FoodCell? {
            changeDeleteBtnToAddBtn(btn: cell.checkboxBtn)

        }
    }
    
    
    func changeDeleteBtnToAddBtn(btn: UIButton) {
        
        btn.setTitle("اضافة", for: .normal)
        btn.setTitleColor(.blue, for: .normal)
        btn.isEnabled = false
        //to uncheck on original food list
        FoodDB.checkOrUncheckOnOriginalList(food: FoodDB.getProperList(passTagNum: tagNumber)[btn.tag], isChecked: false)
        //
        FoodDB.getProperList(passTagNum: tagNumber)[btn.tag].amount = ""
             
        //to remove from the basket
        FoodDB.removeFromBasket(food: FoodDB.getProperList(passTagNum: tagNumber)[btn.tag])
        
        //to clear textfield
        setTxtFieldEmpty(tag: btn.tag)
        
        //
        checkIfBasketIsEmptyOfFill()
        
    }
    
    
    
    func prepareForChangeAddBtnToDeleteBtn(tag: Int) {

           let indexPath = IndexPath(row: tag, section: 0)
           let cell = foodTableView.cellForRow(at: indexPath) as! FoodCell
           changeAddBtnToDeleteBtn(btn: cell.checkboxBtn)
       }
    
    func changeAddBtnToDeleteBtn(btn: UIButton) {
        
        btn.setTitle("حذف", for: .normal)
        btn.setTitleColor(.red, for: .normal)
        btn.isEnabled = true
        //to check on original food list
        FoodDB.checkOrUncheckOnOriginalList(food: FoodDB.getProperList(passTagNum: tagNumber)[btn.tag], isChecked: true)
        //to add in the basket
        FoodDB.addToBasket(food: FoodDB.getProperList(passTagNum: tagNumber)[btn.tag])
        
//        //
         checkIfBasketIsEmptyOfFill()

    }
    
    func getBtnTitle(tag: Int) -> String{
        
        let indexPath = IndexPath(row: tag, section: 0)
        let cell = foodTableView.cellForRow(at: indexPath) as! FoodCell
        return cell.checkboxBtn.titleLabel!.text!
    }
    
    func getAmountTxtfield(tag: Int) -> UITextField {
        
        let indexPath = IndexPath(row: tag, section: 0)
        let cell = foodTableView.cellForRow(at: indexPath) as! FoodCell
        return cell.amountTxtField
    }
    

    func checkIftxtfieldEmptyOrNot(myTxtfield: UITextField) {
        
        print("ENTERED END EDITING")
               print("TEXT: \(myTxtfield.text!)")
               //Insert new element
               if myTxtfield.text != "" && myTxtfield.text != nil  {
                   print("ENTER IF")
                   let ifExist = FoodDB.findInBasket(food: FoodDB.getProperList(passTagNum: tagNumber)[myTxtfield.tag])
                   
                   FoodDB.getProperList(passTagNum: tagNumber)[myTxtfield.tag].amount = myTxtfield.text!
                   //if is exit in foodBasketArray
                   if ifExist > -1 {
                   FoodDB.foodBasket[FoodDB.findInBasket(food: FoodDB.getProperList(passTagNum: tagNumber)[myTxtfield.tag])].amount = myTxtfield.text!
                    //
                    checkIfBasketIsEmptyOfFill()
                    
                    return
                   }
                   
                   prepareForChangeAddBtnToDeleteBtn(tag: myTxtfield.tag)
                   
               //delete element
               } else {
                   print("ENTERE THE ELSE IF")
                   
                   FoodDB.getProperList(passTagNum: tagNumber)[myTxtfield.tag].amount = ""
                   prepareForChangeDeleteBtnToAddBtn(tag: myTxtfield.tag)
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
        cell.amountTxtField.tag = indexPath.row
        
        
        // to check if selected
        if FoodDB.getProperList(passTagNum: tagNumber)[indexPath.row].checked {
            cell.checkboxBtn.setTitle("حذف", for: .normal)
            cell.checkboxBtn.setTitleColor(.red, for: .normal)
            
        } else {
            
            cell.checkboxBtn.setTitle("اضافة", for: .normal)
            cell.checkboxBtn.setTitleColor(.blue, for: .normal)
        }
              
        //
        if FoodDB.getProperList(passTagNum: tagNumber)[indexPath.row].amount != ""
        && FoodDB.getProperList(passTagNum: tagNumber)[indexPath.row].checked{
            
             cell.amountTxtField.text = FoodDB.getProperList(passTagNum: tagNumber)[indexPath.row].amount
        } else {
           cell.amountTxtField.text = ""
        }
        
        //to make it unselectable
        cell.selectionStyle = .none
        
        
        
        return cell
    }
    
    func checkIfBasketIsEmptyOfFill() {
           
           if FoodDB.foodBasket.count == 0 {
               basketBtn.image = UIImage(named: "shopping-basket-empty")
           }
           else {
                basketBtn.image = UIImage(named: "shopping-basket-fill")
           }
       }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        view.endEditing(true)
    }
    
}


