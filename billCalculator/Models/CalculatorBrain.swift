//
//  CalculatorBrain.swift
//  billCalculator
//
//  Created by Mateusz Uszyński on 01/09/2020.
//  Copyright © 2020 Mateusz Uszyński. All rights reserved.
//

import Foundation

struct CalculatorBrain {
    var billValue = "0.0" //total bill
    var personValue = "0.0" //bill per person
    
    mutating func calculate(t tip: Float, b bill: String, p person: Double) {
        let tipInt = Int(tip) //tips are only integers \
        let tipValue = (Float(bill)! * Float(tipInt))/100
        let totalBill = tipValue + Float(bill)!
        billValue = String(format: "%.2f", totalBill)
        
        let perperson = totalBill / Float(person)
        personValue = String(format: "%.2f", perperson)
    }
    
    func getBill() -> String {
        return billValue
    }
    
    func getPerson() -> String {
        return personValue
    }
}
