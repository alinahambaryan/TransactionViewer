//
//  File.swift
//  TransactionViewer
//
//  Created by ALINA HAMBARYAN on 12/1/16.
//  Copyright © 2016 ALINA HAMBARYAN. All rights reserved.
//

import XCTest
@testable import TransactionViewer

class TransactionTests: XCTestCase {
    var viewModel: TransactionsViewModel!
    var transactionService: TransactionPListService!
    var rateService: RatePListService!

    override func setUp() {
        super.setUp()
        self.transactionService = TransactionPListService()
        self.rateService = RatePListService()
    }
    
    func testNumberOfTransactionsBySKU() {
        self.viewModel = TransactionsViewModel(transactionService: self.transactionService, rateService: self.rateService, productSku: "A0911")
        self.viewModel.prepareTransactionCellViewModels()

        XCTAssertTrue(self.viewModel.cellViewModels.count == 424)
    }
    
    func testNumberOfTransactions() {
        self.viewModel = TransactionsViewModel(transactionService: self.transactionService, rateService: self.rateService, productSku: "")
        self.viewModel.prepareTransactionCellViewModels()

        XCTAssertTrue(self.viewModel.transactions.count == 5187)
    }
    
    func testNumberOfRates() {
        self.viewModel = TransactionsViewModel(transactionService: self.transactionService, rateService: self.rateService, productSku: "")
        self.viewModel.prepareTransactionCellViewModels()

        XCTAssertTrue(self.viewModel.rates.count == 6)
    }
}
