//
//  AthleticFormViewController.swift
//  MobileAppDev3
//
//  Created by Nidhi Krishna on 1/28/24.
//

import UIKit

var AthCount = 0;
var Athkey: String = "";

class AthleticFormViewController: UIViewController, UITextFieldDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var AthSave: UIBarButtonItem!
    @IBOutlet weak var AthNameInput: UITextField!
    @IBOutlet weak var AthYrsInput: UITextField!
    @IBOutlet weak var AthParticInput: UITextView!
    @IBOutlet weak var AthHrsInput: UITextField!
    @IBOutlet weak var AthAchievInput: UITextView!
    @IBOutlet weak var AthPhotoOutput: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setupAddTargetIsNotEmptyTextFields();
    }
    

    
    func setupAddTargetIsNotEmptyTextFields() {
        AthSave.isEnabled = false //hidden okButton
        AthNameInput.addTarget(self, action: #selector(textFieldsIsNotEmpty),
                                    for: .editingChanged)
        AthHrsInput.addTarget(self, action: #selector(textFieldsIsNotEmpty),
                                    for: .editingChanged)
        AthYrsInput.addTarget(self, action: #selector(textFieldsIsNotEmpty),
                                    for: .editingChanged)
       }

    
    @IBAction func AthUploadPhoto(_ sender: Any) {
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.delegate = self
        vc.allowsEditing = true
        present(vc, animated: true)
    }
    
    @objc func textFieldsIsNotEmpty(sender: UITextField) {

        sender.text = sender.text?.trimmingCharacters(in: .whitespaces)

        guard
            let name = AthNameInput.text, !name.isEmpty,
            let role = AthHrsInput.text, !role.isEmpty,
            let hrs = AthYrsInput.text, !hrs.isEmpty
        else
        {
            AthSave.isEnabled = false
            return
        }
        // enable okButton if all conditions are met
        AthSave.isEnabled = true
       }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    
    @IBAction func AthSaveClicked(_ sender: Any) {
            
            
            Athkey = "AthName" + String(AthCount);
            UserDefaults.standard.set(AthNameInput.text, forKey: Athkey);
            
            
            Athkey = "AthYear" + String(AthCount);
            UserDefaults.standard.set(AthYrsInput.text, forKey: Athkey);
                
            Athkey = "AthParticipation" + String(AthCount);
            UserDefaults.standard.set(AthParticInput.text, forKey: Athkey);
            
            Athkey = "AthHrs" + String(AthCount);
            UserDefaults.standard.set(AthHrsInput.text, forKey: Athkey);
            
            Athkey = "AthAchiev" + String(AthCount);
            UserDefaults.standard.set(AthAchievInput.text, forKey: Athkey);
        
            Athkey = "AthImage" + String(AthCount);
            UserDefaults.standard.set(AthPhotoOutput.image?.pngData(), forKey: Athkey);
        
            performSegue(withIdentifier: "backToAthHome", sender: self)

    
            
        
         AthCount+=1;
        
        
    }
    
    
}
extension AthleticFormViewController: UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let imageInfo = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")] as? UIImage{
            AthPhotoOutput.image = imageInfo
        }
        picker.dismiss(animated: true, completion: nil)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            picker.dismiss(animated: true, completion: nil)
        }
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

