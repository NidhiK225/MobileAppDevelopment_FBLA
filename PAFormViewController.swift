//
//  PAFormViewController.swift
//  MobileAppDev3
//
//  Created by Nidhi Krishna on 1/31/24.
//

import UIKit
var PACount = 0;
var PAKey: String = "";

class PAFormViewController: UIViewController, UITextFieldDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var PASave: UIBarButtonItem!
    @IBOutlet weak var PATypeInput: UITextField!
    @IBOutlet weak var PADescInput: UITextView!
    @IBOutlet weak var PAHrsInput: UITextField!
    @IBOutlet weak var PARoleInput: UITextField!
    @IBOutlet weak var PAAchievInput: UITextView!
    @IBOutlet weak var PAPhotoOutput: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        setupAddTargetIsNotEmptyTextFields()
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
        PASave.isEnabled = false //hidden okButton
        PATypeInput.addTarget(self, action: #selector(textFieldsIsNotEmpty),
                                    for: .editingChanged)
        PARoleInput.addTarget(self, action: #selector(textFieldsIsNotEmpty),
                                    for: .editingChanged)
        PAHrsInput.addTarget(self, action: #selector(textFieldsIsNotEmpty),
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
            let name = PATypeInput.text, !name.isEmpty,
            let role = PARoleInput.text, !role.isEmpty,
            let hrs = PAHrsInput.text, !hrs.isEmpty
        else
        {
            PASave.isEnabled = false
            return
        }
        // enable okButton if all conditions are met
        PASave.isEnabled = true
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

            PAKey = "PAType" + String(PACount);
            UserDefaults.standard.set(PATypeInput.text, forKey: PAKey);
            
            PAKey = "PADesc" + String(PACount);
            UserDefaults.standard.set(PADescInput.text, forKey: PAKey);
            
            PAKey = "PARole" + String(PACount);
            UserDefaults.standard.set(PARoleInput.text, forKey: PAKey);
        
            PAKey = "PAHrs" + String(PACount);
            UserDefaults.standard.set(PAHrsInput.text, forKey: PAKey);
            
            PAKey   = "PAAchiev" + String(PACount);
            UserDefaults.standard.set(PAAchievInput.text, forKey: PAKey);
            
            PAKey = "PAImage" + String(PACount);
            UserDefaults.standard.set(PAPhotoOutput.image?.pngData(), forKey: PAKey);
            
            
            
            PACount+=1;
            
            
            print(UserDefaults.standard.object(forKey: "PAType0") as! String);
            
            performSegue(withIdentifier: "backToPAHome", sender: self);
        
  
    }
    

}
extension PAFormViewController: UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let imageInfo = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")] as? UIImage{
            PAPhotoOutput.image = imageInfo
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
