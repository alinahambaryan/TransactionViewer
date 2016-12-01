//
//  TransactionPListService.swift
//  TransactionViewer
//
//  Created by ALINA HAMBARYAN on 11/30/16.
//  Copyright © 2016 ALINA HAMBARYAN. All rights reserved.
//

import Foundation
import Argo

public class TransactionPListService: TransactionsServicing {
    
    public func fetchTransactions() -> [Transaction] {
        if let path = NSBundle.mainBundle().pathForResource("transactions", ofType: "plist") {
            let array: NSArray =  NSArray(contentsOfFile: path)!
            let decoded: Decoded<[Transaction]> = decode(array)
            return decoded.value!
        }
        return []
    }
}