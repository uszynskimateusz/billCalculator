//
//  ViewController.swift
//  billCalculator
//
//  Created by Mateusz Uszyński on 31/08/2020.
//  Copyright © 2020 Mateusz Uszyński. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var billSlider: UISlider!
    
    var billValue = "0.0"
    var personValue = "0.0"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        billTextField.delegate = self
        billTextField.keyboardType = .numberPad
    }

    @IBAction func tipSliderChanged(_ sender: UISlider) {
        let tipPercent = String(format: "%.0f", sender.value)
        tipLabel.text = "\(tipPercent) %"
    }
    
    //MARK: Textfield Methods
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let allowedCharacters = CharacterSet.decimalDigits
        let characterSet = CharacterSet(charactersIn: string)
        return allowedCharacters.isSuperset(of: characterSet)
    }
    
    
    //MARK: Calcualte Methods
    @IBAction func calculatePressed(_ sender: UIButton) {
        
        if billTextField.text != "" { //it takes only numbers
            let tipValue = Int(billSlider.value) //tips are only integers \
            let bill = (Float(billTextField.text!)! * Float(tipValue))/100
            let totalBill = bill + Float(billTextField.text!)!
            billValue = String(format: "%.2f", totalBill)
        }
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }

    //MARK: Seque Methods
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.billValue = billValue
            destinationVC.personValue = "0.0"
        }
    }
}

