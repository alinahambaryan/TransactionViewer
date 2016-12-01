//
//  ProductsViewModel.swift
//  TransactionViewer
//
//  Created by ALINA HAMBARYAN on 11/30/16.
//  Copyright © 2016 ALINA HAMBARYAN. All rights reserved.
//

import Foundation

class ProductsViewModel {
    var allTransactions = [Transaction]([])
    var products = [Transaction]([])
    var cellViewModels = [ProductCellViewModel]([])
    
    var transactionService: TransactionPListService
    
    init(transactionService:TransactionPListService) {
        self.transactionService = transactionService
    }
    
    func prepareProductCellViewModels(){
        self.allTransactions = self.transactionService.fetchTransactions()
        self.products = self.allTransactions
        
        var seen: [String:Bool] = [:]
        self.products = self.products.filter{seen.updateValue(true, forKey: $0.sku) == nil}
        self.products = self.products.sort{$0.sku < $1.sku}
       
        self.cellViewModels = self.products
            .map {ProductCellViewModel(productName: $0.sku, numberOfTranactions: self.getTransactionNumberFor($0.sku))}
    }
    
    func getTransactionNumberFor(productName: String) -> String{
        return String(self.allTransactions.filter{$0.sku == productName}.count)
    }
}