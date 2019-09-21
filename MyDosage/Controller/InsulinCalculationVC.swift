//
//  InsulinCalculationVC.swift
//  MyDosage
//
//  Created by Os on 9/21/19.
//  Copyright © 2019 Os. All rights reserved.
//

import UIKit



class InsulinCalculationVC: UIViewController {

    //UI View
    @IBOutlet weak var insulinTxtFiled: UITextField!
    
    @IBOutlet weak var calculateBtn: UIButton!
    
    @IBOutlet weak var result: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Insuline txtfield design
        insulinTxtFiled.layer.borderWidth = 1
        insulinTxtFiled.layer.borderColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        insulinTxtFiled.layer.cornerRadius = 5
        
        //calculate btn
        calculateBtn.layer.cornerRadius = 5
        
        //tap gesture
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        
        view.addGestureRecognizer(tap)

    }
    
    @IBAction func calculateInsulin(_ sender: UIButton) {
        dismissKeyboard()
        result.text = "20"
    }
    
    @objc func dismissKeyboard() {
        
        view.endEditing(true)
    }
    

}
