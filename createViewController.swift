//
//  createViewController.swift
//  MAD4
//
//  Created by Rachel John on 1/31/24.
//

import UIKit

class createViewController: UIViewController, UITextFieldDelegate, UINavigationControllerDelegate {
    

    @IBOutlet weak var AccountDone: UIBarButtonItem!
    @IBOutlet weak var AccountNameInput: UITextField!
    @IBOutlet weak var AccountEmailInput: UITextField!
    @IBOutlet weak var AccountPhoneInput: UITextField!
    @IBOutlet weak var AccountAddressInput: UITextView!
    @IBOutlet weak var AccountPass1Input: UITextField!
    @IBOutlet weak var AccountPass2Input: UITextField!
  
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupAddTargetIsNotEmptyTextFields();
    }
    
    func setupAddTargetIsNotEmptyTextFields() {
        AccountDone.isEnabled = false //hidden okButton
        AccountNameInput.addTarget(self, action: #selector(textFieldsIsNotEmpty),
                                    for: .editingChanged)
        AccountEmailInput.addTarget(self, action: #selector(textFieldsIsNotEmpty),
                                    for: .editingChanged)
        AccountPhoneInput.addTarget(self, action: #selector(textFieldsIsNotEmpty),
                                    for: .editingChanged)
        AccountPass1Input.addTarget(self, action: #selector(textFieldsIsNotEmpty),
                                    for: .editingChanged)
        AccountPass2Input.addTarget(self, action: #selector(textFieldsIsNotEmpty),
                                    for: .editingChanged)
        }

    
    @objc func textFieldsIsNotEmpty(sender: UITextField) {

        sender.text = sender.text?.trimmingCharacters(in: .whitespaces)

        guard
            let name = AccountNameInput.text, !name.isEmpty,
            let email = AccountEmailInput.text, invalidEmail(email) != "Invalid",
            let pass1 = AccountPass1Input.text, !pass1.isEmpty,
            let pass2 = AccountPass2Input.text, invalidPassword(pass2) != "Invalid",
            let phone = AccountPhoneInput.text, invalidPhoneNumber(phone) != "Invalid"

        else
        {
            AccountDone.isEnabled = false
            return
        }
        // enable okButton if all conditions are met
            AccountDone.isEnabled = true
        
       }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func invalidEmail(_ value: String) -> String?
    {
        let regularExpression = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regularExpression)
        if !predicate.evaluate(with: value)
        {
            AccountEmailInput.textColor = UIColor.systemRed;
            return "Invalid";
        }
        AccountEmailInput.textColor = UIColor.black;
        return nil
    }
    
    func invalidPhoneNumber(_ value: String) -> String?
    {
        let set = CharacterSet(charactersIn: value)
        if !CharacterSet.decimalDigits.isSuperset(of: set) {
            AccountPhoneInput.textColor = UIColor.systemRed
            return "Invalid"
        }
        
        if value.count != 10
        {
            AccountPhoneInput.textColor = UIColor.systemRed
            return "Invalid"
        }
        
        AccountPhoneInput.textColor = UIColor.black

        return nil
            
    }
    
    func invalidPassword(_ value1: String) -> String?
    {
        print(true)

        let passw1 = AccountPass1Input.text
        let passw2 = value1
        if passw1 != passw2
        {
            AccountPass2Input.textColor = UIColor.systemRed;
            return "Invalid"
        }
        
        AccountPass2Input.textColor = UIColor.black;
        return "Valid"
    }
    
    @IBAction func doneClicked(_ sender: Any) {
            
            UserDefaults.standard.set(AccountNameInput.text, forKey: "AccountName");
        
            UserDefaults.standard.set(AccountEmailInput.text, forKey: "AccountEmail");
            
            UserDefaults.standard.set(AccountPhoneInput.text, forKey: "AccountPhone");
            
            UserDefaults.standard.set(AccountAddressInput.text, forKey: "AccountAddress");
        
            UserDefaults.standard.set(AccountPass1Input.text, forKey: "AccountPassword");
        
            performSegue(withIdentifier: "goToMain", sender: self);
        
            
  
    }
    

}
