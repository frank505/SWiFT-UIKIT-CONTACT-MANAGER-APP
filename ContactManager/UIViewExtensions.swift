//
//  UIViewExtensions.swift
//  ContactManager
//
//  Created by MacBook Pro on 22/01/2021.
//

import Foundation
import UIKit
import FlagPhoneNumber



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
    
    func changeNavigationUiColors(_ title:String)
    {
        self.navigationController!.navigationBar.barStyle = .black
        self.navigationController!.navigationBar.isTranslucent = true
        self.navigationController!.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        self.navigationController!.navigationBar.tintColor = #colorLiteral(red: 1, green: 0.99997437, blue: 0.9999912977, alpha: 1)
        
    }
    
    func setImageAsCenterNavBar(_ title:String)
    {
        let image = UIImage(named: title);
        let logoView = UIView.init(frame: CGRect(x: 0, y: 0, width: 0, height: 35))
        let imageView = UIImageView(frame: CGRect(x: -45, y: 5, width: 90, height: 25))
        imageView.image = image
        imageView.contentMode = .scaleAspectFit
        logoView.addSubview(imageView)
        self.navigationItem.titleView = logoView
    }
    
   
   

    func isZipCodeValid( _ textField:UITextField ) -> Bool{
        let regexp = "^[0-9]{5}$"
        let boolVal = textField.text?.evaluate(with: regexp);
        if( boolVal==false){
        textField.layer.borderColor = UIColor.red.cgColor
            return false
        }else{
        textField.layer.borderColor = UIColor.green.cgColor;
            return true
        }
    }

    func isStateValid(_ textField: UITextField) ->Bool{
        let regexp = "^[A-Z]{2}$"
        let boolVal = textField.text?.evaluate(with: regexp);
        if( boolVal==false){
        textField.layer.borderColor = UIColor.red.cgColor
        return false
        }else{
        textField.layer.borderColor = UIColor.green.cgColor;
            return true
        }
       
    }

    func isCVCValid(_ textField: UITextField) ->Bool{
        let regexp = "^[0-9]{3,4}$"
        let boolVal = textField.text?.evaluate(with: regexp);
        if( boolVal==false){
        textField.layer.borderColor = UIColor.red.cgColor
            return false
        }else{
        textField.layer.borderColor = UIColor.green.cgColor;
            return true
        }
    }

    func isEmailValid(_ textField: UITextField) ->Bool {
        let regexp = "[A-Z0-9a-z._]+@([\\w\\d]+[\\.\\w\\d]*)"
        let boolVal = textField.text?.evaluate(with: regexp);
        if( boolVal==false){
        textField.layer.borderColor = UIColor.red.cgColor
            return false
        }else{
        textField.layer.borderColor = UIColor.green.cgColor;
            return true
        }
        
    }
    
    func validateEmptyString(_ textField:UITextField) ->Bool
    {
        if(textField.text=="")
        {
            textField.layer.borderColor = UIColor.red.cgColor;
            return false;
            
        }else
        {
            textField.layer.borderColor = UIColor.green.cgColor;
            return true;
        }
        
    }
    
    
    
    
   
}
