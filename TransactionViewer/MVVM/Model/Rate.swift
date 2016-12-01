//
//  Rate.swift
//  RateViewer
//
//  Created by ALINA HAMBARYAN on 11/30/16.
//  Copyright © 2016 ALINA HAMBARYAN. All rights reserved.
//

import Foundation
import Argo
import Curry

public enum CurrencySign: String {
    case EUR = "€"
    case GBP = "£"
    case CAD = "CA$"
    case USD = "$"
    case AUD = "A$"
}

public class Rate {
    let from: String
    let rate: String
    let to: String
    
    init(from: String, rate: String, to: String) {
        self.from = from
        self.rate = rate
        self.to = to
    }
}
extension Rate: Equatable {}

public func == (left: Rate, right: Rate) -> Bool {
    return left.from == right.from
        && left.rate == right.rate
        && left.to == right.to
}

extension Rate: Decodable {
    public static func decode(j: JSON) -> Decoded<Rate> {
        return curry(Rate.init)
            <^> j <| "from"
            <*> j <| "rate"
            <*> j <| "to"
    }
}