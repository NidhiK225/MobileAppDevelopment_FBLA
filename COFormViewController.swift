//
//  COFormViewController.swift
//  MobileAppDev3
//
//  Created by Nidhi Krishna on 1/7/24.
//

import UIKit
var COCount = 0;
var COkey: String = "";


class COFormViewController: UIViewController, UITextFieldDelegate, UINavigationControllerDelegate {


    
    @IBOutlet weak var COSave: UIBarButtonItem!
    @IBOutlet weak var CONameInput: UITextField!
    @IBOutlet weak var CORoleInput: UITextField!
    @IBOutlet weak var COParticInput: UITextView!
    @IBOutlet weak var COHrsInput: UITextField!
    @IBOutlet weak var COAchievInput: UITextView!
    @IBOutlet weak var COPhotoOutput: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setupAddTargetIsNotEmptyTextFields();
    }
    

    
    func setupAddTargetIsNotEmptyTextFields() {
        COSave.isEnabled = false //hidden okButton
        CONameInput.addTarget(self, action: #selector(textFieldsIsNotEmpty),
                                    for: .editingChanged)
        CORoleInput.addTarget(self, action: #selector(textFieldsIsNotEmpty),
                                    for: .editingChanged)
        COHrsInput.addTarget(self, action: #selector(textFieldsIsNotEmpty),
                                    for: .editingChanged)
       }

    
    @IBAction func COUploadPhoto(_ sender: Any) {
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.delegate = self
        vc.allowsEditing = true
        present(vc, animated: true)
    }
    
    @objc func textFieldsIsNotEmpty(sender: UITextField) {

        sender.text = sender.text?.trimmingCharacters(in: .whitespaces)

        guard
            let name = CONameInput.text, !name.isEmpty,
            let role = CORoleInput.text, !role.isEmpty,
            let hrs = COHrsInput.text, !hrs.isEmpty
        else
        {
            COSave.isEnabled = false
            return
        }
        // enable okButton if all conditions are met
        COSave.isEnabled = true
       }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    
    @IBAction func COSaveClicked(_ sender: Any) {
            
            
            COkey = "COName" + String(COCount);
            UserDefaults.standard.set(CONameInput.text, forKey: COkey);
            
            COkey = "CORole" + String(COCount);
            UserDefaults.standard.set(CORoleInput.text, forKey: COkey);
            
            COkey = "COParticipation" + String(COCount);
            UserDefaults.standard.set(COParticInput.text, forKey: COkey);
            
            COkey = "COHrs" + String(COCount);
            UserDefaults.standard.set(COHrsInput.text, forKey: COkey);
            
            COkey = "COAchiev" + String(COCount);
            UserDefaults.standard.set(COAchievInput.text, forKey: COkey);
        
            COkey = "COImage" + String(COCount);
            UserDefaults.standard.set(COPhotoOutput.image?.pngData(), forKey: COkey);
    
            COCount+=1;
            print(COCount);
        
            performSegue(withIdentifier: "backToCOHome", sender: self)
        
  
    }
    
    
}
extension COFormViewController: UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let imageInfo = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")] as? UIImage{
            COPhotoOutput.image = imageInfo
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

