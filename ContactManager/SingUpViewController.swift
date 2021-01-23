//
//  SingUpViewController.swift
//  ContactManager
//
//  Created by MacBook Pro on 21/01/2021.
//
import UIKit
import Foundation


class SignUpViewController:UIViewController{
    
   
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad();
        view.backgroundColor = UIColor.white;
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true);
        showNavigationBar(animated: true);
        changeNavigationBarUi()
    }
}
