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
        }else{
            textField.layer.borderColor = UIColor.green.cgColor;
        }
    }
    
    
    
    func fpnDisplayCountryList() {
        
    }
    
    
    let screenWidth = UIScreen.main.bounds.size.width;
    let screenHeight = UIScreen.main.bounds.size.height;
    
   
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad();
        
        view.backgroundColor = UIColor.black;
        self.Views();
    }
    
    func customPhoneNumber () -> FPNTextField{
        let phoneNumberTextField = FPNTextField(frame: CGRect(x: 0, y: 0, width: view.bounds.width - 16, height: 50))
        phoneNumberTextField.setFlag(key: .NG)
        phoneNumberTextField.borderStyle = .roundedRect;
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
    
    

    public func Views()
    {
        let username = self.username();
        let email = self.email();
        let password = self.password();
        let customPhone = self.customPhoneNumber()
        let confirm = self.confirmPassword()
        let stackView = UIStackView(arrangedSubviews:
                [username,email,customPhone,password,confirm]);
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
        sender.placeholder == "Username" ?
            validateEmptyString(sender)
        :
            sender.placeholder == "Email" ?
          isEmailValid(sender)
        :
        sender.placeholder=="Password" ?
        validateEmptyString(sender)
        :
        sender.placeholder=="Confirm" ?
        validateEmptyString(sender)
        :
        nil;
            
    }
    
    
  
}
