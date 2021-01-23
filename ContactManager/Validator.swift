//
//  Validator.swift
//  ContactManager
//
//  Created by MacBook Pro on 23/01/2021.
//

import Foundation

protocol Validator
{
    
    func isPhoneNumberValid(text: String) -> Bool {
        let regexp = "^[0-9]{10}$"
        return text.evaluate(with: regexp)
    }

    func isZipCodeValid(text: String) -> Bool {
        let regexp = "^[0-9]{5}$"
        return text.evaluate(with: regexp)
    }

    func isStateValid(text: String) -> Bool {
        let regexp = "^[A-Z]{2}$"
        return text.evaluate(with: regexp)
    }

    func isCVCValid(text: String) -> Bool {
        let regexp = "^[0-9]{3,4}$"
        return text.evaluate(with: regexp)
    }

    func isEmailValid(text: String) -> Bool {
        let regexp = "[A-Z0-9a-z._]+@([\\w\\d]+[\\.\\w\\d]*)"
        return text.evaluate(with: regexp)
    }
    
    
}
