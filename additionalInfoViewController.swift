//
//  additionalInfoViewController.swift
//  MAD4
//
//  Created by Rachel John on 1/29/24.
//

import UIKit

var accountkey: String = ""

class additionalInfoViewController: UIViewController, UITextFieldDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var nameLabel: UITextField!
    @IBOutlet weak var emailLabel: UITextField!
    @IBOutlet weak var phoneNumLabel: UITextField!
    @IBOutlet weak var addressLabel: UITextView!
    @IBOutlet weak var passwordLabel: UITextField!
    @IBOutlet weak var passwordLabelTwo: UITextField!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    var name: String = ""
    var email: String = ""
    var phoneNum: String = ""
    var address: String = ""
    var password: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Update Account Information"
        
        //self.emailLabel.text = UserDefaults.string(forKey: "AccountAddress") as! String;
        //self.phoneNumLabel.text = UserDefaults.string(forKey: "AccountEmail") as! String;
        //self.addressLabel.text = UserDefaults.string(forKey: "AccountPhoneNumber") as! String;
        //self.passwordLabel.text = UserDefaults.string(forKey: "AccountPassword") as! String;

        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveWhenClicked(_ sender: Any) {
        accountKey = "AccountName";
        UserDefaults.standard.set(nameLabel.text, forKey: key);
        
        
        accountKey = "AccountAddress";
        UserDefaults.standard.set(addressLabel.text, forKey: key);
        
        accountKey = "AccountEmail";
        UserDefaults.standard.set(emailLabel.text, forKey: key);
        
        accountKey = "AccountPhoneNumber";
        UserDefaults.standard.set(phoneNumLabel.text, forKey: key);
        
        accountKey = "AccountPassword";
        UserDefaults.standard.set(passwordLabel.text, forKey: key);
        
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
