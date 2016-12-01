//
//  ProductCellViewModel.swift
//  TransactionViewer
//
//  Created by ALINA HAMBARYAN on 11/30/16.
//  Copyright © 2016 ALINA HAMBARYAN. All rights reserved.
//

import Foundation

class ProductCellViewModel {
    let productName : String
    let numberOfTranactions: String
    
    init(productName:String, numberOfTranactions : String) {
        self.productName = productName
        self.numberOfTranactions = String(numberOfTranactions + " transactions" )
    }
}