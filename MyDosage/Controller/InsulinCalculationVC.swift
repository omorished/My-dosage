//
//  InsulinCalculationVC.swift
//  MyDosage
//
//  Created by Os on 9/21/19.
//  Copyright © 2019 Os. All rights reserved.
//

import UIKit



class InsulinCalculationVC: UIViewController {
    
    

    
    //UI Connection
    
    @IBOutlet weak var insulinTxtField: UITextField!
    
    @IBOutlet weak var calculationBtn: UIButton!
    
    @IBOutlet weak var resultLbl: UILabel!
    
    @IBOutlet weak var alertLbl: UILabel!
    
    
    
    
    
    override func viewDidLoad() {
        
        // change back button color
        navigationController!.navigationBar.tintColor = UIColor.white
        

        //calculationBtn Design
        calculationBtn.layer.cornerRadius = 5
        calculationBtn.layer.shadowColor = UIColor.gray.cgColor
        calculationBtn.layer.shadowOffset = CGSize(width: 5, height: 5)
        calculationBtn.layer.shadowOpacity = 1.0
        
        //insuline textfield design
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0.0, y: insulinTxtField.frame.height - 1, width: insulinTxtField.frame.width, height: 1.0)
        bottomLine.backgroundColor = UIColor.darkGray.cgColor
        insulinTxtField.borderStyle = UITextField.BorderStyle.none
        insulinTxtField.layer.addSublayer(bottomLine)
        
        //tap gesture
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        
         view.addGestureRecognizer(tap)
    }
    
    //to dismiss the keyboard whenever click everywhere in the blank view
    @objc func dismissKeyboard() {
    
            view.endEditing(true)
        }
    
    //calculate insulin result
    @IBAction func calculateInsulin(_ sender: UIButton) {
        
        //if alerted before
        alertLbl.text = ""
        
        dismissKeyboard()
        
        if insulinTxtField.text != nil && insulinTxtField.text != "" {
            
            //maybe the user entered arabic number so we want make sure to convert it to english number
            let insulin = FoodDB.convertFromArabicNumToEnglish(arabicNum:  insulinTxtField.text!)
            if insulin != 0 {
            FoodDB.insulin = Double(insulinTxtField.text!)

            let calcInsulin = 500/insulin
            //this calculation for detect decimal points
            let finalResult = Double(round(1000*calcInsulin)/1000)
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
                // if the user enter 0 then alert this message in alertLbl
                alertLbl.text = "الرجاء ادخال رقم اكبر من الصفر"
                FoodDB.insulin = 0
                
            }
            
        } else {
            resultLbl.text = ""
            alertLbl.text = "الرجاء ادخال رقم"
            FoodDB.insulin = 0

        }
        
        
       
    }
    
}
