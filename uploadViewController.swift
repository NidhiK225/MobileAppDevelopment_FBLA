//
//  uploadViewController.swift
//  MAD4
//
//  Created by Rachel John on 1/31/24.
//

import UIKit
var transcriptKey: String = "";

class uploadViewController: UIViewController, UITextFieldDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    @IBOutlet weak var uploadTranscript: UIImageView!
    @IBOutlet weak var transcriptSave: UIBarButtonItem!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Upload Transcript"
        // Do any additional setup after loading the view.
    }
    
    @IBAction func upload(_ sender: Any) {
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.delegate = self
        vc.allowsEditing = true
        present(vc, animated: true)
    }
    
    @IBAction func saveClicked(_ sender: Any) {
        transcriptKey = "Transcript Image";
        UserDefaults.standard.set(uploadTranscript.image?.pngData(), forKey: transcriptKey);
    }
    

    @IBAction func unwindToTranscriptHome(_ sender: UIStoryboardSegue)
    {
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
