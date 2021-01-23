//
//  SliderIntroViewController.swift
//  ContactManager
//
//  Created by MacBook Pro on 22/01/2021.
//

import Foundation
import UIKit
import SwiftVideoBackground


class IntroViewController:UIViewController
{
    let screenWidth = UIScreen.main.bounds.size.width;
    let screenHeight = UIScreen.main.bounds.size.height;
    
 
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        try? VideoBackground.shared.play(view: view, videoName: "vid101", videoType: "mp4")
        self.displayImage();
         self.Views();
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(true);
        hideNavigationBar(animated: true);
    }
    
    public func displayImage()
    {
        let image = UIImage(named: "xing.png");
        let imageView = UIImageView(image: image);
//        let heightFromTop = screenHeight - 200;
        let widthFromLeft = (screenWidth  - (170*2)) ;
        imageView.frame = CGRect(x:120 , y:widthFromLeft, width: 170, height: 140);
        view.addSubview(imageView);
    }
    
    
    
    public func loginButton()->UIButton
    {
        let buttonWidth = self.screenWidth - 40;
        let button = UIButton(type: .system)
        button.setTitle("Login", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.layer.cornerRadius = 5;
        button.translatesAutoresizingMaskIntoConstraints = false
        button.widthAnchor.constraint(equalToConstant: buttonWidth).isActive = true
        button.heightAnchor.constraint(equalToConstant: 45.0).isActive = true
        button.backgroundColor = UIColor.yellow
        return button
    }
    
    
    public func signUpButton() ->UIButton
    {
        let buttonWidth = self.screenWidth - 40;
        let button = UIButton(type: .system);
        button.addTarget(self, action: #selector(moveToSignUpPage) , for: .touchUpInside)
        button.setTitle("Create an Account", for: .normal)
        button.layer.cornerRadius = 5;
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.widthAnchor.constraint(equalToConstant: buttonWidth).isActive = true
     button.heightAnchor.constraint(equalToConstant: 45.0).isActive = true
        button.backgroundColor = UIColor.darkGray
        
        return button
    }
    
    
    @objc func moveToSignUpPage(_ sender:UIView) {
       //some Action
        let signUpController = SignUpViewController();
        self.navigationController?.pushViewController(signUpController, animated:true)
    }
    
    public func Views()
    {
        let loginButton = self.loginButton();
        let signUpButton = self.signUpButton();
        let stackView = UIStackView(arrangedSubviews: [signUpButton,loginButton]);
        stackView.axis = .vertical;
        stackView.spacing = 15;
        stackView.distribution = .fillEqually
        let distanceFromTop = self.screenHeight - 300;
        stackView.layoutMargins = UIEdgeInsets(top: distanceFromTop, left: 20, bottom: 0, right: 20)
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        
        
    }
    
    
  
    
}



