//
//  TransactionsViewModel.swift
//  TransactionViewer
//
//  Created by ALINA HAMBARYAN on 11/30/16.
//  Copyright © 2016 ALINA HAMBARYAN. All rights reserved.
//

import Foundation

class TransactionsViewModel {
    var transactions = [Transaction]([])
    var rates = [Rate]([])
    let productSku:String
    
    var cellViewModels = [TransactionCellViewModel]([])
    var total = String("")
    
    var transactionService: TransactionPListService
    var rateService: RatePListService
    
    init(transactionService:TransactionPListService, rateService:RatePListService, productSku: String) {
        self.transactionService = transactionService
        self.rateService = rateService
        self.productSku = productSku
    }
    
    func prepareTransactionCellViewModels(){
        self.transactions = self.transactionService.fetchTransactions()
        if !self.productSku.isEmpty {
            self.transactions = self.transactions.filter{$0.sku == self.productSku}
        }
        self.rates = self.rateService.fetchRates()
        self.cellViewModels = self.transactions.map({ transaction in
            return TransactionCellViewModel(transaction: transaction, rate:self.prepateRateFor(transaction))
        })
        self.calculateTotal()
    }
    
    func calculateTotal() {
        let totalInGBP = self.cellViewModels.reduce(0.0) { $0 + Double($1.amountInGBPDouble) }
        self.total = "Total:" + String(format:CurrencySign.GBP.rawValue + "%.2f",totalInGBP)
    }
    
    func prepateRateFor(transaction:Transaction) -> Rate {
        let rate : Rate
        var filteredRates = self.rates.filter{$0.from == transaction.currency && $0.to == "GBP" }
        if (transaction.currency == "GBP") {
            /* case 1: rate for the same currency does not exist so we create with convertion rate = 1*/
            rate = Rate(from: "GBP", rate: "1", to: "GBP")
        }
        else if filteredRates.count == 0 {
            /* case 2: if rate does not found:
             1. find conversion rate to GBP
             2. find conversion rate from transaction currency to found from rate of step1
             3. calculate rate
             */
            filteredRates = self.rates.filter{ $0.to == "GBP"}
            let transactionCurrencyRate = filteredRates.first!
            filteredRates = self.rates.filter{$0.from == transaction.currency && $0.to == transactionCurrencyRate.from}
            
            let t1Rate = Double((filteredRates.first?.rate)!)
            let t2Rate = Double((transactionCurrencyRate.rate))
            let calculatedRate : Double = t1Rate! == t2Rate! ? t1Rate! : t2Rate!/t1Rate!
            rate = Rate(from: transaction.currency, rate: String(calculatedRate), to: "GBP")
        } else {
            /* case 3 : rate found in list */
            rate = filteredRates.first!
        }
        return rate
    }
}

