//
//  ProductTableViewController.swift
//  TransactionViewer
//
//  Created by ALINA HAMBARYAN on 11/30/16.
//  Copyright © 2016 ALINA HAMBARYAN. All rights reserved.
//

import Foundation
import UIKit

class ProductTableViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel : ProductsViewModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.loadData()
        self.navigationItem.title = "Products"
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel!.products.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ProductCell", forIndexPath: indexPath) as UITableViewCell
        let current = self.viewModel?.cellViewModels[indexPath.row]
        cell.textLabel?.text = current?.productName
        cell.detailTextLabel?.text = current?.numberOfTranactions

        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "showTransactions") {
            let controller = segue.destinationViewController  as! TransactionTableViewController
            controller.currentSKU = (sender as! UITableViewCell).textLabel?.text
        }
    }
    
    func loadData () {
        /* can be applied injection framework to inject viewmodel*/
        let transactionService = TransactionPListService()
        
        self.viewModel = ProductsViewModel(transactionService: transactionService)
        self.viewModel?.prepareProductCellViewModels()
    }
}