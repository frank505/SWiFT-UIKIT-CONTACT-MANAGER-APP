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
        "PhoneNumber":false,
        "Password":false,
        "Confirm":false,
    ];
    
    
    var phoneNumberTextField : FPNTextField = FPNTextField();
    var  usernameTextField : UITextField = UITextField();
    var emailTextField: UITextField = UITextField();
    var passwordTextField:UITextField = UITextField();
    var confirmTextField:UITextField = UITextField();
    
    func fpnDidSelectCountry(name: String, dialCode: String, code: String) {
        print(name, dialCode, code) // Output "France", "+33", "FR"
    }
    
    func fpnDidValidatePhoneNumber(textField: FPNTextField, isValid: Bool) {

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
        phoneNumberTextField = FPNTextField(frame: CGRect(x: 0, y: 0, width: view.bounds.width - 16, height: 50))
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
        usernameTextField.delegate = self;
        usernameTextField.borderStyle = .roundedRect
        usernameTextField.backgroundColor = .black
        usernameTextField.textColor = .white
        usernameTextField.tintColor = .white
        usernameTextField.translatesAutoresizingMaskIntoConstraints = false;
        usernameTextField.heightAnchor.constraint(equalToConstant: 45.0).isActive = true
        usernameTextField.layer.masksToBounds = true;
        usernameTextField.layer.borderColor = UIColor.yellow.cgColor
        usernameTextField.layer.borderWidth = 1.0
        usernameTextField.attributedPlaceholder = NSAttributedString(string: "Username",attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray]);
        usernameTextField.addTarget(self, action: #selector(validateUserInput), for: .editingChanged);
        return usernameTextField
    }
    
    
    private func email()->UITextField
    {
        emailTextField.delegate = self;
        emailTextField.borderStyle = .roundedRect
        emailTextField.backgroundColor = .black
        emailTextField.textColor = .white
        emailTextField.tintColor = .white
        emailTextField.translatesAutoresizingMaskIntoConstraints = false;
        emailTextField.attributedPlaceholder = NSAttributedString(string: "Email",attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        emailTextField.layer.masksToBounds = true;
        emailTextField.layer.borderColor = UIColor.yellow.cgColor
        emailTextField.layer.borderWidth = 1.0
        emailTextField.heightAnchor.constraint(equalToConstant: 45.0).isActive = true
        emailTextField.addTarget(self, action: #selector(validateUserInput), for: .editingChanged);
        return emailTextField;
    }
    
    
    
    private func password()->UITextField
    {
        passwordTextField.delegate = self;
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.backgroundColor = .black
        passwordTextField.tintColor = .white
        passwordTextField.textColor = .white
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false;
        passwordTextField.attributedPlaceholder = NSAttributedString(string: "Password",attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        passwordTextField.isSecureTextEntry = true
        passwordTextField.layer.masksToBounds = true;
        passwordTextField.layer.borderColor = UIColor.yellow.cgColor
        passwordTextField.layer.borderWidth = 1.0
      passwordTextField.heightAnchor.constraint(equalToConstant: 45.0).isActive = true
        passwordTextField.addTarget(self, action: #selector(validateUserInput), for: .editingChanged);
        return passwordTextField;
    }
    
    private func confirmPassword()->UITextField
    {
        confirmTextField.delegate = self;
        confirmTextField.borderStyle = .roundedRect
       confirmTextField.backgroundColor = .black
        confirmTextField.tintColor = .white
        confirmTextField.textColor = .white
        confirmTextField.translatesAutoresizingMaskIntoConstraints = false;
        confirmTextField.attributedPlaceholder = NSAttributedString(string: "Confirm",attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        confirmTextField.isSecureTextEntry = true
        confirmTextField.layer.masksToBounds = true;
        confirmTextField.layer.borderColor = UIColor.yellow.cgColor
        confirmTextField.layer.borderWidth = 1.0
      confirmTextField.heightAnchor.constraint(equalToConstant: 45.0).isActive = true
        confirmTextField.addTarget(self, action: #selector(validateUserInput), for: .editingChanged);
        return confirmTextField;
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
        stackView.topAnchor.constraint(equalTo:view.topAnchor , constant:100).isActive = true;
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
        
        if sender.placeholder == "Confirm" {
            self.errResponse["Confirm"] =  validateEmptyString(sender)
        }
    

    }
    
    
    @objc func createAccount(_ sender:UIButton, forEvent event:UIEvent) -> Bool
    {
        for (key,value) in self.errResponse {
            print("\(key) the \(value)")
            if value as! Bool==false
            {
                SharedClass.sharedInstance.alert(view: self, title: "\(key) Error",
                message: "\(key) was not filled properly \(value)")
                return false;
            }
        }
        
       
        
        if passwordTextField.text != confirmTextField.text
        {
            print("error here")
            SharedClass.sharedInstance.alert(view: self, title: "Password Error",
                                             message: "Password and Confirm Password do not match");
            return false;
        }
        
        return true;
    }
    
  
}
