



import UIKit

class BasketVC: UIViewController {
    
    
    //
    @IBOutlet weak var basketTableView: UITableView!
    
    @IBOutlet weak var resultLbl: UILabel!
    
    @IBOutlet weak var calcBtn: UIButton!
    
    
    override func viewWillDisappear(_ animated: Bool) {
        view.endEditing(true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        
        var tag = 0
        
        //to avoid problems
        if sender.tag == FoodDB.foodBasket.count {
            tag = sender.tag - 1
        } else {
            tag = sender.tag
        }

        basketTableView.beginUpdates()

        FoodDB.checkOrUncheckOnOriginalList(food: FoodDB.foodBasket[tag], isChecked: false)
        FoodDB.removeFromBasket(food: FoodDB.foodBasket[tag])
        
        
        basketTableView.deleteRows(at: [IndexPath(row: tag, section: 0)], with: .automatic)
        basketTableView.endUpdates()
        
        
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
        
                   if sender.text == "" || sender.text == nil {
                       
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
            print("Food Name: \(food.foodName)")
            print("THE AMOUNT SENDER TAG: \(sender.tag)")
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
        resultLbl.text = "\(total)"
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
