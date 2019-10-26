//


import UIKit

class FoodListVC: UIViewController {
    
    //
    @IBOutlet weak var foodTableView: UITableView!
    
    //food object (declare)
    var foodDB = FoodDB()
    var proteinList: [Food] = []
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //
        foodTableView.delegate = self
        foodTableView.dataSource = self
        
        //get protein list
        proteinList = foodDB.getProteinList()
        
           //tap gesture
             let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
             
              view.addGestureRecognizer(tap)
        
   
    }
    
   //when checkbox clicked
    @IBAction func checkboxClicked(_ sender: UIButton) {
        dismissKeyboard()
        
        if proteinList[sender.tag].checked {
            sender.setTitle("اضافة", for: .normal)
            sender.setTitleColor(.blue, for: .normal)
            proteinList[sender.tag].checked = !proteinList[sender.tag].checked
        } else {
            sender.setTitle("حذف", for: .normal)
            sender.setTitleColor(.red, for: .normal)
            proteinList[sender.tag].checked = !proteinList[sender.tag].checked
        }
        
       
    }
    
    //to dismiss the keyboard whenever click everywhere in the blank view
       @objc func dismissKeyboard() {
                view.endEditing(true)
           }

}

    

extension FoodListVC: UITableViewDelegate, UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return proteinList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let food = proteinList[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "foodCell") as! FoodCell
        
        //configurtion
        cell.setFood(food: food)
        cell.checkboxBtn.tag = indexPath.row
        
        
        // to check if selected
        if proteinList[indexPath.row].checked {
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


