//
//  TransactionViewController.swift
//  TransactionViewer
//
//  Created by ALINA HAMBARYAN on 11/30/16.
//  Copyright © 2016 ALINA HAMBARYAN. All rights reserved.
//

import Foundation
import UIKit

class TransactionTableViewController: BaseViewController, UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var totalLabel: UILabel!
    
    var viewModel : TransactionsViewModel?
    var currentSKU :String? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.loadData()
        self.setupUI()
    }
    
    func setupUI() {
        self.totalLabel.text = self.viewModel?.total
        self.navigationItem.title = "Transactions for " + self.currentSKU!
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel!.transactions.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .Value1, reuseIdentifier: "TransactionCell")
        let current = viewModel?.cellViewModels[indexPath.row]
        cell.textLabel?.text = current?.intialAmount
        cell.detailTextLabel?.text = current?.amountInGBP

        return cell
    }
    
    func loadData () {
        /* can be applied injection framework to inject viewmodel*/
        let transactionService = TransactionPListService()
        let rateService = RatePListService()
        
        self.viewModel = TransactionsViewModel(transactionService: transactionService, rateService: rateService, productSku:currentSKU!)
        self.viewModel?.prepareTransactionCellViewModels()
    }
}

