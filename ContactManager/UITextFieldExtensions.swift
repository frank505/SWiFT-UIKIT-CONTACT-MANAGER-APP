//
//  UITextFieldExtensions.swift
//  ContactManager
//
//  Created by MacBook Pro on 23/01/2021.
//

import Foundation
import UIKit


extension UITextField
{

    func validateField(_ functions: [(String) -> Bool]) -> Bool {
            return functions.map { f in f(self.text ?? "") }
                            .reduce(true) { $0 && $1 }
        }
    
}
