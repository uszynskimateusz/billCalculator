//
//  ResultViewController.swift
//  billCalculator
//
//  Created by Mateusz Uszyński on 01/09/2020.
//  Copyright © 2020 Mateusz Uszyński. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var totalBill: UILabel!
    @IBOutlet weak var personBill: UILabel!
    
    var billValue: String?
    var personValue: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        totalBill.text = billValue
        personBill.text = personValue
    }
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
