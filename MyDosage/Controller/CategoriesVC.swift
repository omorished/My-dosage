

import UIKit

class CategoriesVC: UIViewController {
    
    
    //UI Connection
    @IBOutlet weak var proteinBtn: CategoryUIButton!
    @IBOutlet weak var milkAndDairyBtn: CategoryUIButton!
    @IBOutlet weak var vegBtn: CategoryUIButton!
    @IBOutlet weak var fruitBtn: CategoryUIButton!
    @IBOutlet weak var carboBtn: CategoryUIButton!
    //
    @IBOutlet weak var basketBtn: UIBarButtonItem!
    //
    
    @IBOutlet weak var foodSearchBar: UISearchBar!
    
    @IBOutlet weak var searchResultTableView: UITableView!
    
    //to check if the user click on the search button
    var searchCliecked: Bool = false
    // to show all list of the food, so we need to put all names in one array
    var foodNamesArray: [String] = []
    //this changable array, if the user put any charecter then the updated array is this
    var resultArray: [String] = []
    
    // check if the user find the food by searching
    var searching: Bool = false
    
    //if the view is going to disapper
    override func viewWillDisappear(_ animated: Bool) {
        
        dismissKeyboard()
        //the app will hidde the table view
        searchResultTableView.isHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        checkIfBasketIsEmptyOfFill()
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // change back button color
        navigationController!.navigationBar.tintColor = UIColor.white
    
            
    //
        searchResultTableView.delegate = self
        searchResultTableView.dataSource = self
        
        
    //to make button circle
    proteinBtn.layer.cornerRadius = proteinBtn.frame.size.width / 2

    milkAndDairyBtn.layer.cornerRadius = milkAndDairyBtn.frame.size.width / 2

    vegBtn.layer.cornerRadius = vegBtn.frame.size.width / 2
        
    milkAndDairyBtn.layer.cornerRadius = milkAndDairyBtn.frame.size.width / 2
        
    fruitBtn.layer.cornerRadius = fruitBtn.frame.size.width / 2
        
    carboBtn.layer.cornerRadius = carboBtn.frame.size.width / 2
        
    //searchbar searchBtn
        foodSearchBar.delegate = self
        UIBarButtonItem.appearance(whenContainedInInstancesOf: [UISearchBar.self]).title = "بحث"

        
        
    
    
        
    //tap gesture
         let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
         
          view.addGestureRecognizer(tap)
        
        
        // get all food names for search
        foodNamesArray = FoodDB.getDataForSearchResults()

        
        
        }
    
    //
    @IBAction func btnClicked(_ sender: CategoryUIButton) {
        
        performSegue(withIdentifier: "goToFoodList", sender: sender)
    }
    

    
    //to dismiss the keyboard whenever click everywhere in the blank view
    @objc func dismissKeyboard() {
    
            view.endEditing(true)
        }
    
    //
    func searchBtnClicked() {
        if foodSearchBar.text != nil && foodSearchBar.text != "" {
            let result = FoodDB.findInOriginalList(foodName: foodSearchBar.text!)
            // exist
            if result[0] != -1 {
                searchCliecked = true
                performSegue(withIdentifier: "goToFoodList", sender: result)
            } else {
                // do nothing
            }

        }
    }
    
    
    @IBAction func foodResultBtnClicked(_ sender: UIButton) {
        
        //this button in the cells
        let result = FoodDB.findInOriginalList(foodName: (sender.titleLabel?.text!)!)
        
        searchCliecked = true
        
        performSegue(withIdentifier: "goToFoodList", sender: result)

        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "goToFoodList" {
            if let VC = segue.destination as? FoodListVC {
                //if the user use search
                if searchCliecked {
                    let result = sender as! [Int]
                    VC.tagNumber = result[0]
                    VC.itsNumberInArray = result[1]
                    VC.searchClicked = true
                    //
                    searchCliecked = false
                    foodSearchBar.text = ""
                } // if the user click in the category and didn't use search
                else {
                    let btnPressed = sender as! CategoryUIButton
                    VC.tagNumber = btnPressed.tag
                }
              
            }
        }
    }
    
    
     func checkIfBasketIsEmptyOfFill() {
        
        if FoodDB.foodBasket.count == 0 {
            basketBtn.image = UIImage(named: "shopping-basket-empty")
        }
        else {
             basketBtn.image = UIImage(named: "shopping-basket-fill")
        }
    }
    

}

extension CategoriesVC: UISearchBarDelegate {

    //it is actually search btn
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBtnClicked()
        dismissKeyboard()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        //if the search bar is empty hide the tableview
        if searchText != "" {
            
        searchResultTableView.isHidden = false
            resultArray = foodNamesArray.filter({$0.contains(searchText)})
        searching = true
        searchResultTableView.reloadData()
            
        } else {
            
            searchResultTableView.isHidden = true
            
        }
        
    }

}



extension CategoriesVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if searching {
            return resultArray.count
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "searchCell") as! SearchCell
        let foodName = resultArray[indexPath.row] //get for result array and get it
        cell.foodNameBtn.setTitle(foodName, for: .normal) // set the text of the food in the array and assign it to the cell
        
        return cell
        
        
    }
    
    //this search button that locate in the keyboard
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        searchBtnClicked()
    }
    
    
}
