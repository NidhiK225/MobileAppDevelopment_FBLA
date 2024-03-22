//
//  CommunityFormViewController.swift
//  MobileAppDev3
//
//  Created by Nidhi Krishna on 1/6/24.
//

import UIKit
var CommunityCount = 0;
var key: String = "";

class CommunityFormViewController: UIViewController, UITextFieldDelegate, UINavigationControllerDelegate{

    
    @IBOutlet weak var CommunitySave: UIBarButtonItem!
    @IBOutlet weak var CommunityNameInput: UITextField!
    @IBOutlet weak var CommunityRoleInput: UITextField!
    @IBOutlet weak var CommunityParticInput: UITextView!
    @IBOutlet weak var CommunityHrsInput: UITextField!
    @IBOutlet weak var CommunityAchievInput: UITextView!
    @IBOutlet weak var CommunityPhotoOutput: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setupAddTargetIsNotEmptyTextFields();
    }
    

    
    func setupAddTargetIsNotEmptyTextFields() {
        CommunitySave.isEnabled = false //hidden okButton
        CommunityNameInput.addTarget(self, action: #selector(textFieldsIsNotEmpty),
                                    for: .editingChanged)
        CommunityRoleInput.addTarget(self, action: #selector(textFieldsIsNotEmpty),
                                    for: .editingChanged)
        CommunityHrsInput.addTarget(self, action: #selector(textFieldsIsNotEmpty),
                                    for: .editingChanged)
       }

    
    @IBAction func UploadPhoto(_ sender: Any) {
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.delegate = self
        vc.allowsEditing = true
        present(vc, animated: true)
    }
    
    @objc func textFieldsIsNotEmpty(sender: UITextField) {

        sender.text = sender.text?.trimmingCharacters(in: .whitespaces)

        guard
            let name = CommunityNameInput.text, !name.isEmpty,
            let role = CommunityRoleInput.text, !role.isEmpty,
            let hrs = CommunityHrsInput.text, !hrs.isEmpty
        else
        {
            CommunitySave.isEnabled = false
            return
        }
        // enable okButton if all conditions are met
        CommunitySave.isEnabled = true
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
            
            
            key = "Name" + String(CommunityCount);
            UserDefaults.standard.set(CommunityNameInput.text, forKey: key);
            
            key = "Role" + String(CommunityCount);
            UserDefaults.standard.set(CommunityRoleInput.text, forKey: key);
            
            key = "Participation" + String(CommunityCount);
            UserDefaults.standard.set(CommunityParticInput.text, forKey: key);
            
            key = "Hrs" + String(CommunityCount);
            UserDefaults.standard.set(CommunityHrsInput.text, forKey: key);
            
            key = "Achiev" + String(CommunityCount);
            UserDefaults.standard.set(CommunityAchievInput.text, forKey: key);
        
            key = "Image" + String(CommunityCount);
            UserDefaults.standard.set(CommunityPhotoOutput.image?.pngData(), forKey: key);
            
        performSegue(withIdentifier: "backToCommHome", sender: self)

        
            CommunityCount+=1;
        
  
    }
    
    
}
extension CommunityFormViewController: UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let imageInfo = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")] as? UIImage{
            CommunityPhotoOutput.image = imageInfo
        }
        picker.dismiss(animated: true, completion: nil)
    }
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            picker.dismiss(animated: true, completion: nil)
        }
    }
