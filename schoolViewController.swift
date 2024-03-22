//
//  schoolViewController.swift
//  MAD4
//
//  Created by Rachel John on 1/31/24.
//

import UIKit
var schoolKey = 0;

class schoolViewController: UIViewController, UITextFieldDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var schoolName: UITextField!
    @IBOutlet weak var unweightedGPA: UITextField!
    @IBOutlet weak var weightedGPA: UITextField!
    @IBOutlet weak var testScore: UITextField!
    @IBOutlet weak var schoolSave: UIBarButtonItem!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setupAddTargetIsNotEmptyTextFields();
    }
    

    
    func setupAddTargetIsNotEmptyTextFields() {
        schoolSave.isEnabled = false //hidden okButton
        schoolName.addTarget(self, action: #selector(textFieldsIsNotEmpty),
                                    for: .editingChanged)
        unweightedGPA.addTarget(self, action: #selector(textFieldsIsNotEmpty),
                                    for: .editingChanged)
        weightedGPA.addTarget(self, action: #selector(textFieldsIsNotEmpty),
                                    for: .editingChanged)
       }

    
   
    @objc func textFieldsIsNotEmpty(sender: UITextField) {

        sender.text = sender.text?.trimmingCharacters(in: .whitespaces)

        guard
            let name = schoolName.text, !name.isEmpty,
            let score = testScore.text, !score.isEmpty,
            let gpa1 = unweightedGPA.text, !gpa1.isEmpty,
            let gpa2 = weightedGPA.text, !gpa2.isEmpty
        else
        {
            schoolSave.isEnabled = false
            return
        }
        // enable okButton if all conditions are met
        schoolSave.isEnabled = true
       }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func saveClicked(_ sender: Any) {
            
            
            key = "SchoolName" + String(schoolKey);
            UserDefaults.standard.set(schoolName.text, forKey: key);
            
            key = "UWGPA" + String(schoolKey);
            UserDefaults.standard.set(unweightedGPA.text, forKey: key);
            
            key = "WGPA" + String(schoolKey);
            UserDefaults.standard.set(weightedGPA.text, forKey: key);
            
            key = "Score" + String(schoolKey);
            UserDefaults.standard.set(testScore.text, forKey: key);
            
        
            schoolKey+=1;
        
  
    }
  
}
