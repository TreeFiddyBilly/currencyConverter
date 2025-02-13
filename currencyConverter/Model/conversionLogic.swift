//
//  conversionLogic.swift
//  currencyConverter
//
//  Created by user270532 on 2/13/25.
//

import Foundation

struct CurrencyConverter {
    var amountInUSD: Int = 0
    var convertToGBP: Bool = false
    var convertToCLP: Bool = false
    var convertToPHP: Bool = false
    var convertToNOK: Bool = false
    
    let exchangeRates: [String: Float] = [
        //formula sources: https://themoneyconverter.com/USD/GBP
        "GBP": 0.7959,
        "CLP": 946.2046,
        "PHP": 57.9181,
        "NOK": 11.1535
    ]
    
    func calculateConversions() -> [String: Float] {
        var convertedAmounts: [String: Float] = [:]
        
        if convertToGBP {
            convertedAmounts["GBP"] = Float(amountInUSD) * exchangeRates["GBP"]!
        }
        if convertToCLP {
            convertedAmounts["CLP"] = Float(amountInUSD) * exchangeRates["CLP"]!
        }
        if convertToPHP {
            convertedAmounts["PHP"] = Float(amountInUSD) * exchangeRates["PHP"]!
        }
        if convertToNOK {
            convertedAmounts["NOK"] = Float(amountInUSD) * exchangeRates["NOK"]!
        }
        
        return convertedAmounts
    }
}
