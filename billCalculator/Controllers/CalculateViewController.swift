//
//  ViewController.swift
//  billCalculator
//
//  Created by Mateusz Uszyński on 31/08/2020.
//  Copyright © 2020 Mateusz Uszyński. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController, UITextFieldDelegate {
    
    var calculateBrain = CalculatorBrain()
    
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var billSlider: UISlider!
    @IBOutlet weak var personLabel: UILabel!
    @IBOutlet weak var personStepper: UIStepper!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        billTextField.delegate = self
        billTextField.keyboardType = .numberPad
        
        tipSliderChanged(billSlider)
    }
    @IBAction func personStepperPressed(_ sender: UIStepper) {
        personLabel.text = Int(sender.value).description
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
            calculateBrain.calculate(t: billSlider.value, b: billTextField.text!, p: personStepper.value)
        }
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }

    //MARK: Seque Methods
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.billValue = calculateBrain.getBill()
            destinationVC.personValue = calculateBrain.getPerson()
   
        }
    }
}

