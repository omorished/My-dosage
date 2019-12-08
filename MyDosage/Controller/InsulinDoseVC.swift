




import UIKit

class InsulinDoseVC: UIViewController {

    //UI Connection
    @IBOutlet weak var sugerMeasurementTxtfield: UITextField!
    
    @IBOutlet weak var insulinLbl: UILabel!
    
 
    @IBOutlet weak var insulinTxtField: UITextField!
    
    @IBOutlet weak var calculateBtn: UIButton!
    
    @IBOutlet weak var insulinResultLbl: UILabel!
    
    @IBOutlet weak var alertLbl: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // change back button color
        navigationController!.navigationBar.tintColor = UIColor.white
        
        // to make navigation bar transpirant
//        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
//        self.navigationController?.navigationBar.shadowImage = UIImage()
//        self.navigationController?.navigationBar.isTranslucent = true
//        self.navigationController?.view.backgroundColor = .clear
//        
        if FoodDB.insulin != nil && FoodDB.insulin != 0 {
            
            insulinLbl.isHidden = true
            insulinTxtField.isHidden = true
            
        }
        
     //calculationBtn Design
       calculateBtn.layer.cornerRadius = 5
       calculateBtn.layer.shadowColor = UIColor.gray.cgColor
       calculateBtn.layer.shadowOffset = CGSize(width: 5, height: 5)
       calculateBtn.layer.shadowOpacity = 1.0
       
       //sugerMeasurementTxtfield textfield design
       let bottomLine1 = CALayer()
       bottomLine1.frame = CGRect(x: 0.0, y: sugerMeasurementTxtfield.frame.height - 1, width: sugerMeasurementTxtfield.frame.width, height: 1.0)
       bottomLine1.backgroundColor = UIColor.darkGray.cgColor
       sugerMeasurementTxtfield.borderStyle = UITextField.BorderStyle.none
       sugerMeasurementTxtfield.layer.addSublayer(bottomLine1)
       
        //totalDosesTxtfield textfield design
          let bottomLine2 = CALayer()
          bottomLine2.frame = CGRect(x: 0.0, y: insulinTxtField.frame.height - 1, width: insulinTxtField.frame.width, height: 1.0)
          bottomLine2.backgroundColor = UIColor.darkGray.cgColor
          insulinTxtField.borderStyle = UITextField.BorderStyle.none
          insulinTxtField.layer.addSublayer(bottomLine2)
        
        
        
       //tap gesture
       let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
       
        view.addGestureRecognizer(tap)
           }
           
           //to dismiss the keyboard whenever click everywhere in the blank view
           @objc func dismissKeyboard() {
           
                   view.endEditing(true)
               }
    
    
    @IBAction func calculateBtnPresses(_ sender: UIButton) {
        
        alertLbl.text = ""
        
        dismissKeyboard()
        
        if sugerMeasurementTxtfield.text != nil && sugerMeasurementTxtfield.text != "" &&  FoodDB.insulin != nil {
                 
             let sugerMesur = FoodDB.convertFromArabicNumToEnglish(arabicNum: sugerMeasurementTxtfield.text!)
                 
            if sugerMesur != 0 && FoodDB.carbResult != 0 && FoodDB.insulin != 0 {
                     
         //conditions
         //(1) if suger measurment < 70
         if sugerMesur < 70 {
            
            
             //alert to the user
             let alert = UIAlertController(title: "تنبيه ", message: "السكر منخفض", preferredStyle: UIAlertController.Style.alert)
             alert.addAction(UIAlertAction(title: "حسناً", style: UIAlertAction.Style.default, handler: nil))
             self.present(alert, animated: true, completion: nil)
             
             let insulinResult = Int ((FoodDB.carbResult!) / (FoodDB.insulin!))
             insulinResultLbl.text = String(insulinResult)
         }
         
         //(2) if sugar between 70 and 160
         else if sugerMesur >= 70 && sugerMesur <= 160 {
             let insulinResult = Int ((FoodDB.carbResult!) / (FoodDB.insulin)!)
             insulinResultLbl.text = String(insulinResult)
               
         }
             
         //(3) if sugar between 70 and 160
         else {
             let subtraction = 160 - sugerMesur
             let division = subtraction / FoodDB.insulin!
             let carbOverInsulin = FoodDB.carbResult! / FoodDB.insulin!
             let result = Int(division + carbOverInsulin)
             
             insulinResultLbl.text = String(result)
             
                     }
                 } else {
                    
                    
                    alertLbl.text = "ادخل رقم اكبر من الصفر"
                 }
                 
        } else {
            alertLbl.text = "الرجاء ادخال رقم"
        }
        
    }
    
    @IBAction func sugarMeasurementEndEditing(_ sender: UITextField) {
        //nothing
    }
    
    @IBAction func insulinEndEditing(_ sender: UITextField) {
          
        if sender.text != nil && sender.text != "" {

              let insulin = FoodDB.convertFromArabicNumToEnglish(arabicNum: sender.text!)
            
            if insulin != 0 {
                
                let calcInsulin = 500/insulin
                let finalResult = Double(round(1000*calcInsulin)/1000)
                FoodDB.insulin = finalResult
            }
            
            else {
                alertLbl.text = "ادخل رقم اكبر من الصفر"
            }
        }
        
        
    }
    
    
    
    

}
