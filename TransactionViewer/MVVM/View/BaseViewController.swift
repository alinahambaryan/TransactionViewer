//
//  BaseViewController.swift
//  TransactionViewer
//
//  Created by ALINA HAMBARYAN on 11/30/16.
//  Copyright © 2016 ALINA HAMBARYAN. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    func showErrorWithMessage(title: String, message: String, actionHandler: () -> Void) {
        let alertController = UIAlertController(title: NSLocalizedString(title, comment: ""), message: NSLocalizedString(message, comment: ""), preferredStyle: .Alert)
        let okAction = UIAlertAction(title: "OK", style: .Default) {  _ in  actionHandler() }
        alertController.addAction(okAction)
        self.presentViewController(alertController, animated: true, completion: nil)
    }
}