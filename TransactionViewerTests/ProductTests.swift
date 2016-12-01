//
//  ProductTests.swift
//  TransactionViewer
//
//  Created by ALINA HAMBARYAN on 12/1/16.
//  Copyright © 2016 ALINA HAMBARYAN. All rights reserved.
//

import XCTest
@testable import TransactionViewer

class ProductTests: XCTestCase {
    var viewModel: ProductsViewModel!
    var transactionService: TransactionPListService!
    
    override func setUp() {
        super.setUp()
        self.transactionService = TransactionPListService()
        self.viewModel = ProductsViewModel(transactionService: self.transactionService)
        self.viewModel.prepareProductCellViewModels()
    }
    
    func testNumberOfProducts() {
        XCTAssertTrue(self.viewModel.products.count == 12)
    }
    
    func testTransactionNumberForProduct() {
        XCTAssertTrue(self.viewModel.getTransactionNumberFor("X1893") == "427")
    }
}
