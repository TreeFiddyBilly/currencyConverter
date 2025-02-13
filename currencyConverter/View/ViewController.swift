//
//  ViewController.swift
//  currencyConverter
//
//  Created by user270532 on 2/13/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var amountTextField: UITextField!
        
        // Toggle switches for the currencies:
        @IBOutlet weak var gbpSwitch: UISwitch!
        @IBOutlet weak var clpSwitch: UISwitch!
        @IBOutlet weak var phpSwitch: UISwitch!
        @IBOutlet weak var nokSwitch: UISwitch!
        
        var currencyConverter = CurrencyConverter()
        
        // This dictionary will store the conversion results.
        var conversionResults: [String: Float] = [:]
        
        override func viewDidLoad() {
            super.viewDidLoad()
        }
        
        // Optional: Update the converter model as switches change.
        @IBAction func gbpSwitchChanged(_ sender: UISwitch) {
            currencyConverter.convertToGBP = sender.isOn
        }
        
        @IBAction func clpSwitchChanged(_ sender: UISwitch) {
            currencyConverter.convertToCLP = sender.isOn
        }
        
        @IBAction func phpSwitchChanged(_ sender: UISwitch) {
            currencyConverter.convertToPHP = sender.isOn
        }
        
        @IBAction func nokSwitchChanged(_ sender: UISwitch) {
            currencyConverter.convertToNOK = sender.isOn
        }
        
        @IBAction func calculate(_ sender: UIButton) {
            guard let amountText = amountTextField.text,
                  let amount = Int(amountText) else {
                let alert = UIAlertController(title: "Invalid Input",
                                              message: "Please enter a valid amount.",
                                              preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default))
                present(alert, animated: true)
                return
            }
            
            currencyConverter.amountInUSD = amount
            currencyConverter.convertToGBP = gbpSwitch.isOn
            currencyConverter.convertToCLP = clpSwitch.isOn
            currencyConverter.convertToPHP = phpSwitch.isOn
            currencyConverter.convertToNOK = nokSwitch.isOn
            
            conversionResults = currencyConverter.calculateConversions()
            
         
            performSegue(withIdentifier: "toConversionResults", sender: self)
        }
        
        // Pass to other controller
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "toConversionResults" {
                let destinationVC = segue.destination as! ConversionResultsViewController
                destinationVC.conversionResults = conversionResults
            }
        }
    }

