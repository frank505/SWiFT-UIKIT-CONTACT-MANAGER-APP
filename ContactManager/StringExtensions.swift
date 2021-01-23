//
//  StringExtensions.swift
//  ContactManager
//
//  Created by MacBook Pro on 23/01/2021.
//

import Foundation

extension String{
    
    func evaluate(with condition: String) -> Bool {
           guard let range = range(of: condition,
                                   options: .regularExpression,
                                   range: nil,
                                   locale: nil) else {
               return false
           }

           return range.lowerBound == startIndex
                  && range.upperBound == endIndex
       }
}
