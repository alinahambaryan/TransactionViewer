//
//  Transaction.swift
//  TransactionViewer
//
//  Created by ALINA HAMBARYAN on 11/30/16.
//  Copyright © 2016 ALINA HAMBARYAN. All rights reserved.
//

import Foundation
import Argo
import Curry

public class Transaction {
    let currency: String
    let amount: String
    let sku: String
    
    init(currency: String, amount: String, sku: String) {
        self.currency = currency
        self.amount = amount
        self.sku = sku
    }
    
}

extension Transaction: Decodable {
    public static func decode(j: JSON) -> Decoded<Transaction> {
        return curry(Transaction.init)
            <^> j <| "currency"
            <*> j <| "amount"
            <*> j <| "sku"
    }
}

extension Transaction: Equatable {}

public func == (left: Transaction, right: Transaction) -> Bool {
    return left.currency == right.currency
        && left.amount == right.amount
        && left.sku == right.sku
}