//
//  AwardsFormViewController.swift
//  MobileAppDev3
//
//  Created by Nidhi Krishna on 1/10/24.
//

import UIKit
var AwardsCount = 0;
var AwardsKey: String = "";


class AwardsFormViewController: UIViewController, UITextFieldDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var AwardsSave: UIBarButtonItem!
    @IBOutlet weak var AwardsNameInput: UITextField!
    @IBOutlet weak var AwardsDescInput: UITextView!
    @IBOutlet weak var AwardsDateInput: UITextField!
    @IBOutlet weak var AwardsPhotoOutput: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func setupAddTargetIsNotEmptyTextFields() {
        AwardsSave.isEnabled = false //hidden okButton
        AwardsNameInput.addTarget(self, action: #selector(textFieldsIsNotEmpty),
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
            let name = AwardsNameInput.text, !name.isEmpty
        else
        {
            AwardsSave.isEnabled = false
            return
        }
        // enable okButton if all conditions are met
        AwardsSave.isEnabled = true
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
            
            
            AwardsKey = "AwardsName" + String(AwardsCount);
            UserDefaults.standard.set(AwardsNameInput.text, forKey: AwardsKey);
            
            AwardsKey = "AwardsDesc" + String(AwardsCount);
            UserDefaults.standard.set(AwardsDescInput.text, forKey: AwardsKey);
            
            
            AwardsKey = "AwardsDate" + String(AwardsCount);
            UserDefaults.standard.set(AwardsDateInput.text, forKey: AwardsKey);
            
            AwardsKey = "AwardsImage" + String(AwardsCount);
            UserDefaults.standard.set(AwardsPhotoOutput.image?.pngData(), forKey: AwardsKey);
            
        
            AwardsCount+=1;
        
        performSegue(withIdentifier: "backToAwardsHome", sender: self)

        
  
    }
    

}
extension AwardsFormViewController: UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let imageInfo = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")] as? UIImage{
            AwardsPhotoOutput.image = imageInfo
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
