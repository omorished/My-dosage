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
    
    
    override func viewDidLoad() {
        
        //insulinTxtField Design
//        insulinTxtField.layer.borderWidth = 1
//        insulinTxtField.layer.borderColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
//        insulinTxtField.layer.cornerRadius = 5
        
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
        
        dismissKeyboard()
        if insulinTxtField.text != nil && insulinTxtField.text != ""{
            
            let insulin = Double(insulinTxtField.text!)!
            let calcInsulin = 500/insulin
            resultLbl.text = String(Double(round(1000*calcInsulin)/1000))
            
        } else {
            //do nothing
        }
        
        
       
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

//    //UI View
//    @IBOutlet weak var insulinTxtFiled: UITextField!
//
//    @IBOutlet weak var calculateBtn: UIButton!
//
//    @IBOutlet weak var result: UILabel!
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        //Insuline txtfield design
//        insulinTxtFiled.layer.borderWidth = 1
//        insulinTxtFiled.layer.borderColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
//        insulinTxtFiled.layer.cornerRadius = 5
//
//        //calculate btn
//        calculateBtn.layer.cornerRadius = 5
//
//        //tap gesture
//        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
//
//        view.addGestureRecognizer(tap)
//
//    }
//
//
//
//    @IBAction func calc(_ sender: UIButton) {
//        //my code
//    }
//
//    @objc func dismissKeyboard() {
//
//        view.endEditing(true)
//    }
//

}
