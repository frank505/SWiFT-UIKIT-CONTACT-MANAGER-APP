//
//  SingUpViewController.swift
//  ContactManager
//
//  Created by MacBook Pro on 21/01/2021.
//
import UIKit
import Foundation


class SignUpViewController:UIViewController{
    
    let screenWidth = UIScreen.main.bounds.size.width;
    let screenHeight = UIScreen.main.bounds.size.height;
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad();
        view.backgroundColor = UIColor.black;
        self.Views();
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true);
        showNavigationBar(animated: true);
        changeNavigationBarUi()
        changeNavigationUiColors("");
        setImageAsCenterNavBar("xing.png")
    }
    
    private func username() -> UITextField
    {
        let textField = UITextField();
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .black
        textField.textColor = .white
        textField.tintColor = .white
        textField.translatesAutoresizingMaskIntoConstraints = false;
        textField.heightAnchor.constraint(equalToConstant: 45.0).isActive = true
        textField.layer.masksToBounds = true;
        textField.layer.borderColor = UIColor.yellow.cgColor
        textField.layer.borderWidth = 1.0
        textField.attributedPlaceholder = NSAttributedString(string: "Username",attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        return textField
    }
    
    
    private func email()->UITextField
    {
        let textField = UITextField();
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .black
        textField.textColor = .white
        textField.tintColor = .white
        textField.translatesAutoresizingMaskIntoConstraints = false;
        textField.attributedPlaceholder = NSAttributedString(string: "Email",attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        textField.layer.masksToBounds = true;
        textField.layer.borderColor = UIColor.yellow.cgColor
        textField.layer.borderWidth = 1.0
      textField.heightAnchor.constraint(equalToConstant: 45.0).isActive = true
        return textField;
    }
    
    
    
    private func password()->UITextField
    {
        let textField = UITextField();
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .black
        textField.tintColor = .white
        textField.textColor = .white
        textField.translatesAutoresizingMaskIntoConstraints = false;
        textField.attributedPlaceholder = NSAttributedString(string: "Password",attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        textField.isSecureTextEntry = true
        textField.layer.masksToBounds = true;
        textField.layer.borderColor = UIColor.yellow.cgColor
        textField.layer.borderWidth = 1.0
      textField.heightAnchor.constraint(equalToConstant: 45.0).isActive = true
        return textField;
    }
    
    
    private func mobileNumber()
    {
        
    }
    
    public func Views()
    {
        let username = self.username();
        let email = self.email();
        let password = self.password();
        let stackView = UIStackView(arrangedSubviews: [username,email,password]);
        stackView.axis = .vertical;
        stackView.spacing = 18;
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        stackView.topAnchor.constraint(equalTo:view.topAnchor , constant:150).isActive = true;
        stackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40).isActive = true
        stackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -40).isActive = true
    }
    
}
