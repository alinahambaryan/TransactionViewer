//
//  TransactionServicing.swift
//  TransactionViewer
//
//  Created by ALINA HAMBARYAN on 11/30/16.
//  Copyright © 2016 ALINA HAMBARYAN. All rights reserved.
//

import Foundation

public protocol RateServicing {
    
    func fetchRates() -> [Rate]
}
