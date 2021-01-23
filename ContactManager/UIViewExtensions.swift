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
    
   
}
