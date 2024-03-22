//
//  PAOptionViewController.swift
//  MobileAppDev3
//
//  Created by Nidhi Krishna on 2/11/24.
//

import UIKit

class PAOptionViewController: UIViewController, UINavigationControllerDelegate {
    
    var type = UserDefaults.standard.object(forKey: "PAType" + String(opt)) as! String
    var role = UserDefaults.standard.object(forKey: "PARole" + String(opt)) as! String
    var desc = UserDefaults.standard.object(forKey: "PADesc" + String(opt)) as! String
    var hours = UserDefaults.standard.object(forKey: "PAHrs" + String(opt)) as! String
    var achievements = UserDefaults.standard.object(forKey: "PAAchiev" + String(opt)) as! String
    
    @IBOutlet weak var PATypeOption: UITextField!
    @IBOutlet weak var PADescOption: UITextView!
    @IBOutlet weak var PAHrsOption: UITextField!
    @IBOutlet weak var PARoleOption: UITextField!
    @IBOutlet weak var PAAchievOption: UITextView!
    @IBOutlet weak var PAPhotoOption: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        PATypeOption.text = type
        PARoleOption.text = role
        PADescOption.text = desc
        PAHrsOption.text = hours
        PAAchievOption.text = achievements
        // Do any additional setup after loading the view.
    }

    @IBAction func ifEdited(_ sender: Any) {
        print("YAY")
        UserDefaults.standard.set(PATypeOption.text, forKey: "PAType" + String(opt));
        UserDefaults.standard.set(PARoleOption.text, forKey: "PARole" + String(opt));
        print(UserDefaults.standard.object(forKey: "PAType" + String(opt)) as! String);
        if PADescOption != nil {
            UserDefaults.standard.set(PADescOption.text, forKey: "PADesc" + String(opt));
        }

        UserDefaults.standard.set(PAHrsOption.text, forKey: "PAHrs" + String(opt));

        if PAAchievOption != nil {
            UserDefaults.standard.set(PAAchievOption.text, forKey: "PAAchiev" + String(opt));
        }
        
        performSegue(withIdentifier: "goBackToPAHome", sender: self)

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
