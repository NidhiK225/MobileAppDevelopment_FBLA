//
//  settingsViewController.swift
//  MAD4
//
//  Created by Rachel John on 1/31/24.
//

import UIKit
var settingsKey: String = "";

class settingsViewController: UIViewController {
    
    @IBOutlet weak var linkedinAccount: UITextField!
    @IBOutlet weak var settingsSave: UIBarButtonItem!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func saveClicked(_ sender: Any) {
        settingsSave.isEnabled = true;
        
        settingsKey = "LinkedIn Account";
        UserDefaults.standard.set(linkedinAccount.text, forKey: settingsKey);
        
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
