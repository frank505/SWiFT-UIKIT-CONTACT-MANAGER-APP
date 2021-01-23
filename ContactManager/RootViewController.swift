//
//  RootViewController.swift
//  ContactManager
//
//  Created by MacBook Pro on 21/01/2021.
//

import Foundation
import UIKit


class RootViewController:UIViewController
{
    
    let activityIndicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.large);
    
  

    
    override func viewDidLoad() {
        super.viewDidLoad();
        hideNavigationBar(animated: true);
        view.backgroundColor = UIColor.black;
        self.showActivityIndicator();
        let introView = IntroViewController();
        navigationController?.pushViewController(introView, animated:true);
//       let singUpView = SignUpViewController();
//     navigationController?.pushViewController(singUpView, animated: true);
    }
    
    public func showActivityIndicator(){
        activityIndicator.color = UIColor.white;
        activityIndicator.center = CGPoint(x: view.bounds.size.width/2, y: view.bounds.size.height/2);
        view.addSubview(activityIndicator);
        activityIndicator.startAnimating();
    }
    
    
}
