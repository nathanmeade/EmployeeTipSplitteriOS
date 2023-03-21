//
//  TipSharingCalculatorViewController.swift
//  Employee Tip Splitter
//
//  Created by Nathan Meade on 3/21/23.
//

import UIKit

class TipSharingCalculatorViewController: UIViewController {

    @IBOutlet weak var totalTipAmountTextField: UITextField!
    @IBOutlet weak var fohPercentageTextField: UITextField!
    @IBOutlet weak var fohEmployeesTextField: UITextField!
    @IBOutlet weak var bohEmployeesTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func calculateButtonTapped(_ sender: Any) {
        guard let totalTipAmountString = totalTipAmountTextField.text,
              let fohPercentageString = fohPercentageTextField.text,
              let fohEmployeesString = fohEmployeesTextField.text,
              let bohEmployeesString = bohEmployeesTextField.text,
              let totalTipAmount = Double(totalTipAmountString),
              let fohPercentage = Double(fohPercentageString),
              let fohEmployees = Int(fohEmployeesString),
              let bohEmployees = Int(bohEmployeesString) else {
            // Handle invalid inputs
            resultLabel.text = "Invalid input"
            return
        }
        
        let totalEmployees = fohEmployees + bohEmployees
        let fohTipAmount = totalTipAmount * fohPercentage / 100
        let bohTipAmount = totalTipAmount - fohTipAmount
        
        let fohTipPerEmployee = fohTipAmount / Double(fohEmployees)
        let bohTipPerEmployee = bohTipAmount / Double(bohEmployees)
        
        resultLabel.text = String(format: "FOH employees receive $%.2f each, BOH employees receive $%.2f each", fohTipPerEmployee, bohTipPerEmployee)
    }
    
}

