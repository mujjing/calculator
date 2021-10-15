//
//  ViewController.swift
//  calculator
//
//  Created by 전지훈 on 2021/10/12.
//

import UIKit

enum Operation {
    case Add
    case Subtract
    case Divide
    case Multiply
    case unknown
}

class ViewController: UIViewController {

    @IBOutlet weak var numberOutputLabel: UILabel!
    
    var displayNumber = ""
    var firstOperand = ""
    var secondOperand = ""
    var resultOperand = ""
    var currentOperation: Operation = .unknown
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func tapNumberButton(_ sender: UIButton) {
        guard let numberValue = sender.titleLabel?.text else {return}
        if self.displayNumber.count < 9 {
            self.displayNumber += numberValue
            self.numberOutputLabel.text = self.displayNumber
        }
    }
    @IBAction func tapAllClearButton(_ sender: UIButton) {
        self.displayNumber = ""
        self.firstOperand = ""
        self.secondOperand = ""
        self.resultOperand = ""
        self.currentOperation = .unknown
        self.numberOutputLabel.text = "0"
    }
    @IBAction func tapDivideButton(_ sender: UIButton) {
        self.operation(.Divide)
    }
    @IBAction func tapMultipyButton(_ sender: UIButton) {
        self.operation(.Multiply)
    }
    @IBAction func tapSubtractButton(_ sender: UIButton) {
        self.operation(.Subtract)
    }
    @IBAction func tapPlusButton(_ sender: UIButton) {
        self.operation(.Add)
    }
    @IBAction func tapEqualButton(_ sender: UIButton) {
        self.operation(self.currentOperation)
    }
    @IBAction func tapDotButton(_ sender: UIButton) {
        if self.displayNumber.count < 8, !self.displayNumber.contains(".") {
            self.displayNumber += self.displayNumber.isEmpty ? "0." : "."
            self.numberOutputLabel.text = self.displayNumber
        }
    }
    
    
    func operation(_ operation:Operation) {
        if self.currentOperation != .unknown {
            if !self.displayNumber.isEmpty {
                self.secondOperand = self.displayNumber
                self.displayNumber = ""
                
                guard let firstOperand = Double(self.firstOperand) else { return }
                
                guard let secondOperand = Double(self.secondOperand)
                else { return }
                
                switch self.currentOperation {
                case .Add:
                    self.resultOperand = "\(firstOperand + secondOperand)"
                case .Subtract:
                    self.resultOperand = "\(firstOperand - secondOperand)"
                case .Multiply:
                    self.resultOperand = "\(firstOperand * secondOperand)"
                case .Divide:
                    self.resultOperand = "\(firstOperand / secondOperand)"
                default:
                    break
                }
                
                if let result = Double(self.resultOperand), result.truncatingRemainder(dividingBy: 1) == 0 {
                    self.resultOperand = "\(Int(result))"
                }
                
                self.firstOperand = self.resultOperand
                self.numberOutputLabel.text = self.resultOperand
            }
            
            self.currentOperation = operation
        } else {
            self.firstOperand = self.displayNumber
            self.currentOperation = operation
            self.displayNumber = ""
        }
    }
}

