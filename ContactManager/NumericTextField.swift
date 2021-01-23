import UIKit
import Foundation
import FlagPhoneNumber

class FPNTextField: UITextField {
    let numericKbdToolbar = UIToolbar()

    // MARK: Initilization
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.initialize()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initialize()
    }

    // Sets up the input accessory view with a Done button that closes the keyboard
    func initialize()
    {
        self.keyboardType = UIKeyboardType.numberPad

        numericKbdToolbar.barStyle = UIBarStyle.default
        let space = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let callback = #selector(FPNTextField.finishedEditing)
        let donebutton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: self, action: callback)
        numericKbdToolbar.setItems([space, donebutton], animated: false)
        numericKbdToolbar.sizeToFit()
        self.inputAccessoryView = numericKbdToolbar
    }

    // MARK: On Finished Editing Function
    @objc func finishedEditing()
    {
        self.resignFirstResponder()
    }
}
