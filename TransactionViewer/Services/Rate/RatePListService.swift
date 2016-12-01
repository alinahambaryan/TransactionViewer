//
//  TransactionPListService.swift
//  TransactionViewer
//
//  Created by ALINA HAMBARYAN on 11/30/16.
//  Copyright © 2016 ALINA HAMBARYAN. All rights reserved.
//

import Foundation
import Argo

public class RatePListService: RateServicing {

    public func fetchRates() -> [Rate] {
        if let path = NSBundle.mainBundle().pathForResource("rates", ofType: "plist") {
            let array: NSArray =  NSArray(contentsOfFile: path)!
            let decoded: Decoded<[Rate]> = decode(array)
            return decoded.value!
        }
        return []
    }
}