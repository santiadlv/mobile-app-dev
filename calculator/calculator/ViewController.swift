//
//  ViewController.swift
//  calculator
//
//  Created by user192416 on 2/22/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var displayLabel: UILabel!
    
    var current = ""
    var operation = ""
    var result: String?
    var opString: String = ""
    
    var canTakeDecimal: Bool = true
    var numIsPositive: Bool = true
    var clearDisplayLabel: Bool = false
    var clearOnEquals: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func processNumber(_ sender: UIButton) {
        if let numberText = sender.titleLabel?.text {
            if !clearDisplayLabel {
                if (displayLabel.text == "0") {
                    displayLabel.text = numberText
                } else {
                    displayLabel.text = displayLabel.text! + numberText
                }
            } else {
                displayLabel.text = numberText
                clearDisplayLabel = false
            }
        }
    }
    
    @IBAction func processDecimal(_ sender: UIButton) {
        guard canTakeDecimal else {
            return
        }
        
        if clearOnEquals {
            reset()
        }
        displayLabel.text = displayLabel.text! + "."
        canTakeDecimal = false
    }
    
    @IBAction func processOperation(_ sender: UIButton) {
        if let operationText = sender.titleLabel?.text {
            if operation.isEmpty {
                current = displayLabel.text ?? "0"
                clearDisplayLabel = true
            } else {
                calculate()
            }
            if operationText == "x" {
                operation = "*"
            } else {
                operation = operationText
            }
        }
    }
    
    @IBAction func processClear(_ sender: UIButton) {
        reset()
        displayLabel.text = "0"
    }
    
    @IBAction func processSignChange(_ sender: UIButton) {
        if numIsPositive {
            displayLabel.text = "-" + displayLabel.text!
            numIsPositive = false
        } else {
            displayLabel.text?.remove(at: displayLabel.text!.startIndex)
            numIsPositive = true
        }
    }
    
    @IBAction func processEquals(_ sender: Any) {
        calculate()
        reset()
    }
    
    func calculate() {
        opString = current + operation + displayLabel.text!
        let expression = NSExpression(format: opString)
        let suma = expression.expressionValue(with: nil, context: nil) as? NSNumber
        displayLabel.text = suma?.stringValue
        current = displayLabel.text!
        clearDisplayLabel = true
    }
    
    func reset() {
        current = ""
        result = nil
        canTakeDecimal = true
        clearDisplayLabel = false
        clearOnEquals = false
        opString = ""
        operation = ""
    }
}
