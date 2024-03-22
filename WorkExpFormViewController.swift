//
//  WorkExpFormViewController.swift
//  MobileAppDev3
//
//  Created by Nidhi Krishna on 1/10/24.
//

import UIKit
var WorkCount = 0;
var Workkey: String = "";

class WorkExpFormViewController: UIViewController, UITextFieldDelegate & UINavigationControllerDelegate {
    
    @IBOutlet weak var WorkSave: UIBarButtonItem!
    @IBOutlet weak var WorkNameInput: UITextField!
    @IBOutlet weak var WorkRoleInput: UITextField!
    @IBOutlet weak var WorkParticInput: UITextView!
    @IBOutlet weak var WorkHrsInput: UITextField!
    @IBOutlet weak var WorkAchievInput: UITextView!
    @IBOutlet weak var WorkPhotoOutput: UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func setupAddTargetIsNotEmptyTextFields() {
        WorkSave.isEnabled = false //hidden okButton
        WorkNameInput.addTarget(self, action: #selector(textFieldsIsNotEmpty),
                                    for: .editingChanged)
        WorkRoleInput.addTarget(self, action: #selector(textFieldsIsNotEmpty),
                                    for: .editingChanged)
        WorkHrsInput.addTarget(self, action: #selector(textFieldsIsNotEmpty),
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
            let name = WorkNameInput.text, !name.isEmpty,
            let role = WorkRoleInput.text, !role.isEmpty,
            let hrs = WorkHrsInput.text, !hrs.isEmpty
        else
        {
            WorkSave.isEnabled = false
            return
        }
        // enable okButton if all conditions are met
        WorkSave.isEnabled = true
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
            
            
            Workkey = "WorkCompany" + String(WorkCount);
            UserDefaults.standard.set(WorkNameInput.text, forKey: Workkey);
            
            Workkey = "WorkRole" + String(WorkCount);
            UserDefaults.standard.set(WorkRoleInput.text, forKey: Workkey);
            
            Workkey = "WorkParticipation" + String(WorkCount);
            UserDefaults.standard.set(WorkParticInput.text, forKey: Workkey);
            
            Workkey = "WorkHrs" + String(WorkCount);
            UserDefaults.standard.set(WorkHrsInput.text, forKey: Workkey);
            
            Workkey = "WorkAchiev" + String(WorkCount);
            UserDefaults.standard.set(WorkAchievInput.text, forKey: Workkey);
        
            Workkey = "WorkImage" + String(WorkCount);
            UserDefaults.standard.set(WorkPhotoOutput.image?.pngData(), forKey: Workkey);
        
            
        
            WorkCount+=1;
        
        performSegue(withIdentifier: "backToWorkHome", sender: self)

        
  
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
extension WorkExpFormViewController: UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let imageInfo = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")] as? UIImage{
            WorkPhotoOutput.image = imageInfo
        }
        picker.dismiss(animated: true, completion: nil)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            picker.dismiss(animated: true, completion: nil)
        }
    }



