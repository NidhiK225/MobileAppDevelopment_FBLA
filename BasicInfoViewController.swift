//
//  BasicInfoViewController.swift
//  MobileAppDev3
//
//  Created by Nidhi Krishna on 1/28/24.
//

import UIKit

class BasicInfoViewController: UIViewController {

    @IBOutlet weak var AccountUpdateDone: UIBarButtonItem!
    @IBOutlet weak var AccountUpdateNameInput: UITextField!
    @IBOutlet weak var AccountUpdateEmailInput: UITextField!
    @IBOutlet weak var AccountUpdatePhoneInput: UITextField!
    @IBOutlet weak var AccountUpdateAddressInput: UITextView!
    @IBOutlet weak var AccountUpdatePass1Input: UITextField!
    @IBOutlet weak var AccountUpdatePass2Input: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        AccountUpdateNameInput.text = UserDefaults.standard.object(forKey: "AccountName") as?String;
        AccountUpdateEmailInput.text = UserDefaults.standard.object(forKey: "AccountEmail") as? String;
        AccountUpdatePhoneInput.text = UserDefaults.standard.object(forKey: "AccountPhone") as? String;
        AccountUpdateAddressInput.text = UserDefaults.standard.object(forKey: "AccountAddress") as? String;
        AccountUpdatePass1Input.text = UserDefaults.standard.object(forKey: "AccountPassword") as? String;

    }
    
    
    
    @IBAction func doneClicked(_ sender: Any) {
            
            UserDefaults.standard.set(AccountUpdateNameInput.text, forKey: "AccountName");
        
            UserDefaults.standard.set(AccountUpdateEmailInput.text, forKey: "AccountEmail");
            
            UserDefaults.standard.set(AccountUpdatePhoneInput.text, forKey: "AccountPhone");
            
            UserDefaults.standard.set(AccountUpdateAddressInput.text, forKey: "AccountAddress");
        
            UserDefaults.standard.set(AccountUpdatePass1Input.text, forKey: "AccountPassword");
                

    }
    


}
