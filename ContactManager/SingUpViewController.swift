//
//  SingUpViewController.swift
//  ContactManager
//
//  Created by MacBook Pro on 21/01/2021.
//
import UIKit
import Foundation
import PhoneNumberKit
import FlagPhoneNumber

class SignUpViewController:UIViewController, FPNTextFieldDelegate{
    
    
    var errResponse : [String:Any] = [
        "Username":false,
        "Email":false,
        "Password":false,
        "PhoneNumber":false,
    ];
    
    func fpnDidSelectCountry(name: String, dialCode: String, code: String) {
        print(name, dialCode, code) // Output "France", "+33", "FR"
    }
    
    func fpnDidValidatePhoneNumber(textField: FPNTextField, isValid: Bool) {
        
//        if isValid {
//            textField.layer.borderColor = UIColor.green.cgColor;// Output
//            print(textField.getRawPhoneNumber());
//            print("hello world")
//              } else {
//                textField.layer.borderColor = UIColor.red.cgColor;
//                print(textField.getRawPhoneNumber());
//                print("hi what!");
//              }
//        print(isValid);
        let countString = textField.text!.count;
        if countString <= 10
        {
            textField.layer.borderColor = UIColor.red.cgColor;
            self.errResponse["PhoneNumber"] = false;
            
        }else{
            textField.layer.borderColor = UIColor.green.cgColor;
            self.errResponse["PhoneNumber"] = true;
        }
    }
    
    
    
    func fpnDisplayCountryList() {
        
    }
    
    
    let screenWidth = UIScreen.main.bounds.size.width;
    let screenHeight = UIScreen.main.bounds.size.height;
    
   
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
         return true
    }
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad();
        view.backgroundColor = UIColor.black;
        self.Views();
    }
    
    func customPhoneNumber () -> FPNTextField{
        let phoneNumberTextField = FPNTextField(frame: CGRect(x: 0, y: 0, width: view.bounds.width - 16, height: 50))
        phoneNumberTextField.delegate = self;
        phoneNumberTextField.setFlag(key: .NG)
        phoneNumberTextField.borderStyle = .roundedRect;
        phoneNumberTextField.backgroundColor = .black;
        phoneNumberTextField.layer.borderColor = UIColor.yellow.cgColor
        phoneNumberTextField.layer.borderWidth = 1.0
        phoneNumberTextField.attributedPlaceholder = NSAttributedString(string: "PhoneNumber",attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray]);
        phoneNumberTextField.addTarget(self, action: #selector(fpnDidValidatePhoneNumber), for: .editingChanged);
        return phoneNumberTextField
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
        textField.delegate = self;
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .black
        textField.textColor = .white
        textField.tintColor = .white
        textField.translatesAutoresizingMaskIntoConstraints = false;
        textField.heightAnchor.constraint(equalToConstant: 45.0).isActive = true
        textField.layer.masksToBounds = true;
        textField.layer.borderColor = UIColor.yellow.cgColor
        textField.layer.borderWidth = 1.0
        textField.attributedPlaceholder = NSAttributedString(string: "Username",attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray]);
        textField.addTarget(self, action: #selector(validateUserInput), for: .editingChanged);
        return textField
    }
    
    
    private func email()->UITextField
    {
        let textField = UITextField();
        textField.delegate = self;
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
        textField.addTarget(self, action: #selector(validateUserInput), for: .editingChanged);
        return textField;
    }
    
    
    
    private func password()->UITextField
    {
        let textField = UITextField();
        textField.delegate = self;
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
        textField.addTarget(self, action: #selector(validateUserInput), for: .editingChanged);
        return textField;
    }
    
    private func confirmPassword()->UITextField
    {
        let textField = UITextField();
        textField.delegate = self;
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .black
        textField.tintColor = .white
        textField.textColor = .white
        textField.translatesAutoresizingMaskIntoConstraints = false;
        textField.attributedPlaceholder = NSAttributedString(string: "Confirm",attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        textField.isSecureTextEntry = true
        textField.layer.masksToBounds = true;
        textField.layer.borderColor = UIColor.yellow.cgColor
        textField.layer.borderWidth = 1.0
      textField.heightAnchor.constraint(equalToConstant: 45.0).isActive = true
        textField.addTarget(self, action: #selector(validateUserInput), for: .editingChanged);
        return textField;
    }
    
    public func signUpButton() ->UIButton
    {
        let button = UIButton(type: .system);
        button.addTarget(self, action: #selector(createAccount) , for: .touchUpInside)
        button.setTitle("Register", for: .normal)
        button.layer.cornerRadius = 5;
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.translatesAutoresizingMaskIntoConstraints = false
     button.heightAnchor.constraint(equalToConstant: 45.0).isActive = true
        button.backgroundColor = UIColor.darkGray
        
        return button
    }

    public func Views()
    {
        let username = self.username();
        let email = self.email();
        let password = self.password();
        let customPhone = self.customPhoneNumber()
        let confirm = self.confirmPassword()
        let signUp = self.signUpButton();
        let stackView = UIStackView(arrangedSubviews:
                [username,email,customPhone,password,confirm,signUp]);
        stackView.axis = .vertical;
          stackView.spacing = 15;
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        stackView.topAnchor.constraint(equalTo:view.topAnchor , constant:150).isActive = true;
        stackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40).isActive = true
        stackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -40).isActive = true;

    }
    
    //object functions
    
    @objc func validateUserInput(_ sender:UITextField,forEvent event: UIEvent)
    {
        if sender.placeholder == "Username" {
            self.errResponse["Username"] = validateEmptyString(sender)
            
        }
        
        if sender.placeholder == "Email" {
            self.errResponse["Email"] = isEmailValid(sender)
            
        }
        
        if sender.placeholder == "Password" {
            self.errResponse["Password"] = validateEmptyString(sender)
        }
    

    }
    
    
    @objc func createAccount(_ sender:UIButton, forEvent event:UIEvent) -> Bool
    {
        for (key,value) in self.errResponse {
            print("\(key) the \(value)")
            if value as! Bool==false
            {
                SharedClass.sharedInstance.alert(view: self, title: "\(key) Error",
                message: "\(key) was not filled properly")
                return false;
            }
        }
        
        
        
        return true;
    }
    
  
}
