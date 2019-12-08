



import UIKit

class BasketVC: UIViewController {
    
    
    //
    @IBOutlet weak var basketTableView: UITableView!
    
    @IBOutlet weak var resultLbl: UILabel!
    
    @IBOutlet weak var calcBtn: UIButton!
    
    @IBOutlet weak var alertLbl: UILabel!
    
    
    
    
    
    override func viewWillDisappear(_ animated: Bool) {
        
        alertLbl.text = ""
        view.endEditing(true)
        resultLbl.text = ""
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // change back button color
        navigationController!.navigationBar.tintColor = UIColor.white
        
        basketTableView.dataSource = self
        basketTableView.delegate = self
        
        
        //Design calc btne
        calcBtn.layer.cornerRadius = 5
        calcBtn.layer.shadowColor = UIColor.gray.cgColor
        calcBtn.layer.shadowOffset = CGSize(width: 5, height: 5)
        calcBtn.layer.shadowOpacity = 1.0

        
       
          //tap gesture
          let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
          
           view.addGestureRecognizer(tap)
        

    }
    
    
     @objc @IBAction func removeBtnClicked(_ sender: UIButton) {
//
//        var tag = 0
//
//        //to avoid problems
//        if sender.tag == FoodDB.foodBasket.count {
//            tag = sender.tag - 1
//        } else {
//            tag = sender.tag
//        }

        basketTableView.beginUpdates()

        print("tag number \(sender.tag)")
        FoodDB.checkOrUncheckOnOriginalList(food: FoodDB.foodBasket[sender.tag], isChecked: false)
        FoodDB.removeFromBasket(food: FoodDB.foodBasket[sender.tag])
        
        
        basketTableView.deleteRows(at: [IndexPath(row: sender.tag, section: 0)], with: .automatic)
        
        basketTableView.endUpdates()
        
        basketTableView.reloadData()
        
        
    }
    
    @IBAction func amountTxtFieldEndEditing(_ sender: UITextField) {
        
        let food: Food!
                  switch(sender.tag){
                  case 0:
                  food = FoodDB.getProperList(passTagNum: 0)[sender.tag]
                  case 1:
                  food = FoodDB.getProperList(passTagNum: 1)[sender.tag]
                  case 2:
                  food = FoodDB.getProperList(passTagNum: 2)[sender.tag]
                  case 3:
                  food = FoodDB.getProperList(passTagNum: 3)[sender.tag]
                  default :
                  food = FoodDB.getProperList(passTagNum: 4)[sender.tag]
                  }
        
                //EXTRA condition if the amount is zero
        if sender.text == "" || sender.text == nil || FoodDB.convertFromArabicNumToEnglish(arabicNum: sender.text!) == 0{
                       
                       var tag = 0
                              
                              //to avoid problems
                              if sender.tag == FoodDB.foodBasket.count {
                                  tag = sender.tag - 1
                              } else {
                                  tag = sender.tag
                              }

                            removeBtnClicked(getBtn(tag: tag))
                       
                   
        } else {
          
            basketTableView.beginUpdates()
                    
            food.amount = sender.text!
            FoodDB.foodBasket[sender.tag].amount = sender.text!
            
            basketTableView.endUpdates()

        }
    }
    
    func getBtn(tag: Int) -> UIButton {
                                 
    let indexPath = IndexPath(row: tag, section: 0)
        if let cell = basketTableView.cellForRow(at: indexPath) as! BasketCell? {
            return cell.checkboxBtn

        }
        return UIButton()
    }
    
    func getTxtfield(tag: Int) -> UITextField {
        
        let indexPath = IndexPath(row: tag, section: 0)
        if let cell = basketTableView.cellForRow(at: indexPath) as! BasketCell? {
            return cell.amountTxtField

        }
        return UITextField()
        

    }
    
    @objc func dismissKeyboard() {
        
//        amountTxtFieldEndEditing(getTxtfield(tag: saveTag))
        view.endEditing(true)
    }
      
    
    @IBAction func calculate(_ sender: UIButton) {
        
        var total: Double = 0.0
        for food in FoodDB.foodBasket {
            let value = FoodDB.convertFromArabicNumToEnglish(arabicNum: food.carb)
            let newAmount = FoodDB.convertFromArabicNumToEnglish(arabicNum: food.amount)
            total = total + (newAmount * value)
        }
        
        if total != 0.0 {
            let finalResult = Double(round(1000*total)/1000)
            FoodDB.carbResult = finalResult
            
            //to check if is integer number to print as integer is good for user UX
            let checkIfNumberWithNoDecimal1 = Int(finalResult)
            let checkIfNumberWithNoDecimal2 = Double(checkIfNumberWithNoDecimal1)
                //to check if the number with no decimal or not
                if finalResult == checkIfNumberWithNoDecimal2 {
                     resultLbl.text = String(checkIfNumberWithNoDecimal1)
                } else {
                     resultLbl.text = String(finalResult)
                }
            
        } else {
            
            // if basket conatain only checkin
            if FoodDB.foodBasket.count > 0 {
               FoodDB.carbResult = nil
               resultLbl.text = "0"
               alertLbl.text = "الرجاء اضافة اي من الاطعمة الاخرى لحساب جرعة الانسولين"
            }
            else {
               FoodDB.carbResult = nil
               resultLbl.text = ""
               alertLbl.text = "الرجاء اضافة اغذية الى السلة"
            }
        }
    }
    
    
    @IBAction func calculateInsulinItemBtnClicked(_ sender: UIBarButtonItem) {

        alertLbl.text = ""

        if resultLbl.text != nil && resultLbl.text != "" {
            let res = Double(resultLbl.text!)
            if res != 0.0 {
                performSegue(withIdentifier: "goToCalculateInsulin", sender: nil)
            }
        }
        
        
    }
    
    
    
}


extension BasketVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return FoodDB.foodBasket.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //
        let food = FoodDB.foodBasket[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "basketCell") as! BasketCell
        //
 
        cell.setFood(food: food)
        cell.checkboxBtn.tag = indexPath.row
        cell.amountTxtField.tag = indexPath.row
        
        // to check if selected
               if FoodDB.foodBasket[indexPath.row].checked {
                cell.checkboxBtn.setTitle("حذف", for: .normal)
                cell.checkboxBtn.setTitleColor(.red, for: .normal)
                cell.amountTxtField.text = FoodDB.foodBasket[indexPath.row].amount
                
                   
               }
        
        //to make it unselectable
               cell.selectionStyle = .none
               
               return cell
        
        
        
    }
    
    
    
   
    
}
