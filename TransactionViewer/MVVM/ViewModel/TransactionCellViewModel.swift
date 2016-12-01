//
//  TransactionCellViewModel.swift
//  TransactionViewer
//
//  Created by ALINA HAMBARYAN on 11/30/16.
//  Copyright © 2016 ALINA HAMBARYAN. All rights reserved.
//

import Foundation

class TransactionCellViewModel {
    let transaction: Transaction
    let rate: Rate?

    let intialAmount:String?
    let amountInGBP: String?
    var amountInGBPDouble = 0.0 /*for calculating total conveniently*/

    init(transaction:Transaction, rate: Rate) {
        self.transaction = transaction
        self.rate = rate
        var sign : String
        switch (transaction.currency){
        case  "USD":
            sign = CurrencySign.USD.rawValue
            break;
        case  "AUD":
            sign = CurrencySign.AUD.rawValue
            break;
        case  "CAD":
            sign = CurrencySign.CAD.rawValue
            break;
        case  "EUR":
            sign = CurrencySign.EUR.rawValue
            break;
        default:
            sign = CurrencySign.GBP.rawValue
            
            break;
        }
        self.intialAmount = String(format:sign + "%.2f", Double (transaction.amount)!)
        self.amountInGBPDouble =  Double(transaction.amount)! * Double (rate.rate)!
        self.amountInGBP = String(format:CurrencySign.GBP.rawValue + "%.2f", self.amountInGBPDouble)
    }
}