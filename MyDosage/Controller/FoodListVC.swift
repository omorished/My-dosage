//


import UIKit

class FoodListVC: UIViewController {
    
    //
    @IBOutlet weak var foodTableView: UITableView!
    //
    @IBOutlet weak var basketBtn: UIBarButtonItem!
    //



    //
//    var category: String = ""
    //this one to check which category we choose
    var tagNumber: Int = 0
    
    //
    //this one to check if the user search for the food
    var searchClicked: Bool = false
    var itsNumberInArray: Int = 0
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        // change back button color
        navigationController!.navigationBar.tintColor = UIColor.white
        
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
   
        foodTableView.reloadData()
        
        // to set top title
        switch (tagNumber) {
        case 1:
            self.title = "بروتين"
        case 2:
            self.title = "الحليب ومشتقاته"
        case 3:
            self.title = "خضار"
        case 4:
            self.title = "فواكه"
        default:
            self.title = "كربوهيدرات"
        }
        

        
        //
        foodTableView.delegate = self
        foodTableView.dataSource = self
        
        
           //tap gesture
             let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
             
              view.addGestureRecognizer(tap)
        
        // to check if the the user find the food by searching it
        if searchClicked {
            searchBtnClicked()
        }
   
    }
    
   //when checkbox clicked
    @IBAction func checkboxClicked(_ sender: UIButton) {
        
        // if it حذف then clear the text
        if sender.titleLabel?.text == "حذف" {
            setTxtFieldEmpty(tag: sender.tag)
        }
        //call this method to make deletion form the basket a
        checkIftxtfieldEmptyOrNot(myTxtfield:  getAmountTxtfield(tag: sender.tag))
        
        dismissKeyboard()
    //
        checkIfBasketIsEmptyOfFill()

    }
    
    //
    @IBAction func amountTxtfieldEndEditing(_ sender: UITextField) {
       
        //if the user clear the text and he/she go out from the textfield, then the food is going to be deleted
        checkIftxtfieldEmptyOrNot(myTxtfield: sender)
    }
    
    //
    @IBAction func amountTxtfieldChanged(_ sender: UITextField) {
        
        //if the textfield change then check if is not empty make the button clickable
        if sender.text == "" || sender.text == nil {
            makeAddBtnUnclickable(tag: sender.tag)
        } else {
            makeAddBtnClickable(tag: sender.tag)
        }
        
    }
    
    

    //make the textfield empty
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
    
    func getBtn(tag: Int) -> UIButton {
        
        let indexPath = IndexPath(row: tag, section: 0)
        let cell = foodTableView.cellForRow(at: indexPath) as! FoodCell
        return cell.checkboxBtn
    }
    
    func getAmountTxtfield(tag: Int) -> UITextField {
        
        let indexPath = IndexPath(row: tag, section: 0)
        let cell = foodTableView.cellForRow(at: indexPath) as! FoodCell
        return cell.amountTxtField
    }
    
    func getAmountunit(tag: Int) -> UILabel {
           
           let indexPath = IndexPath(row: tag, section: 0)
           let cell = foodTableView.cellForRow(at: indexPath) as! FoodCell
           return cell.amountUnitLbl
       }
    
    func getFoodName(tag: Int) -> UILabel {
        
        let indexPath = IndexPath(row: tag, section: 0)
        let cell = foodTableView.cellForRow(at: indexPath) as! FoodCell
        return cell.foodNameLbl
    }
    

    func checkIftxtfieldEmptyOrNot(myTxtfield: UITextField) {
        
    
        //EXTRA Condition if user put zero for amount
        
                //(1) update new element
        if myTxtfield.text != "" && myTxtfield.text != nil && FoodDB.convertFromArabicNumToEnglish(arabicNum: myTxtfield.text!) != 0 {
                //to check if it is already exist in the basket
                   let ifExist = FoodDB.findInBasket(food: FoodDB.getProperList(passTagNum: tagNumber)[myTxtfield.tag])
                   
                   FoodDB.getProperList(passTagNum: tagNumber)[myTxtfield.tag].amount = myTxtfield.text!
                   //if is exist in basket array update the amount
                   if ifExist > -1 {
                   FoodDB.foodBasket[FoodDB.findInBasket(food: FoodDB.getProperList(passTagNum: tagNumber)[myTxtfield.tag])].amount = myTxtfield.text!
                    //
                    checkIfBasketIsEmptyOfFill()
                    
                    return
                   }
                   //(2) insert element
                   prepareForChangeAddBtnToDeleteBtn(tag: myTxtfield.tag)
                   
               //delete element
               } else {
                   
                   FoodDB.getProperList(passTagNum: tagNumber)[myTxtfield.tag].amount = ""
                   prepareForChangeDeleteBtnToAddBtn(tag: myTxtfield.tag)
               }
        
    }
    // the method that we called in ViewDidLoad
    func searchBtnClicked() {
    // to direct the user to the specific food that he/she search for
    DispatchQueue.main.async {
        let indexPath = IndexPath(row: self.itsNumberInArray, section: 0)
        self.foodTableView.scrollToRow(at: indexPath, at: .none, animated: true)
        
        
        self.foodTableView.selectRow(at: indexPath, animated: true, scrollPosition: UITableView.ScrollPosition.middle)

                }
        searchClicked = false

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
            cell.checkboxBtn.isEnabled = true
            
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
        
        //to make delay for selction
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            cell.selectionStyle = .none
            
        }
        
        
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
        dismissKeyboard()
    }
    
}



