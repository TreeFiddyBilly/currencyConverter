//
//  ConversionResults.swift
//  currencyConverter
//
//  Created by user270532 on 2/13/25.
//

import UIKit

class ConversionResultsViewController: UIViewController {

    var conversionResults: [String: Float] = [:]

    @IBOutlet weak var resultsTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayResults()
    }
    
    private func displayResults() {
        // Sort the currency codes for a consistent display order.
        let sortedCurrencies = conversionResults.keys.sorted()
        
        // Build a string that shows each conversion result.
        var resultsText = "Amount in USD:\n\n"
        for currency in sortedCurrencies {
            if let value = conversionResults[currency] {
                resultsText += "\(currency): \(String(format: "%.2f", value))\n"
            }
        }
        
        // Display the results in the text view.
        resultsTextView.text = resultsText
    }
}
