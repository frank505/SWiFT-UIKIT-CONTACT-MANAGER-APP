//
//  UIViewExtensions.swift
//  ContactManager
//
//  Created by MacBook Pro on 22/01/2021.
//

import Foundation
import UIKit


extension UIViewController
{

    func hideNavigationBar(animated: Bool){
            // Hide the navigation bar on the this view controller
            self.navigationController?.setNavigationBarHidden(true, animated: animated)

        }

        func showNavigationBar(animated: Bool) {
            // Show the navigation bar on other view controllers
            self.navigationController?.setNavigationBarHidden(false, animated: animated)
        }
    
    func changeNavigationBarUi(){
        self.navigationController?.navigationBar.backItem?.title = ""
    }
}
