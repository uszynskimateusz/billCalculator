//
//  ViewController.swift
//  billCalculator
//
//  Created by Mateusz Uszyński on 31/08/2020.
//  Copyright © 2020 Mateusz Uszyński. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var billTextField: UITextField!
    
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
}

