//
//  AthOptionViewController.swift
//  MobileAppDev3
//
//  Created by Nidhi Krishna on 2/11/24.
//

import UIKit

class AthOptionViewController: UIViewController, UINavigationControllerDelegate {
    
    var name = UserDefaults.standard.object(forKey: "AthName" + String(opt)) as! String
    var years = UserDefaults.standard.object(forKey: "AthYear" + String(opt)) as! String
    var participation = UserDefaults.standard.object(forKey: "AthParticipation" + String(opt)) as! String
    var hours = UserDefaults.standard.object(forKey: "AthHrs" + String(opt)) as! String
    var achievements = UserDefaults.standard.object(forKey: "AthAchiev" + String(opt)) as! String
    
    @IBOutlet weak var AthNameOption: UITextField!
    @IBOutlet weak var AthYrsOption: UITextField!
    @IBOutlet weak var AthParticOption: UITextView!
    @IBOutlet weak var AthHrsOption: UITextField!
    @IBOutlet weak var AthAchievOption: UITextView!
    @IBOutlet weak var AthPhotoOption: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        AthNameOption.text = name
        AthYrsOption.text = years
        AthParticOption.text = participation
        AthHrsOption.text = hours
        AthAchievOption.text = achievements

        // Do any additional setup after loading the view.
    }
    
    @IBAction func ifEdited(_ sender: Any) {
        print("YAY")
        UserDefaults.standard.set(AthNameOption.text, forKey: "AthName" + String(opt));
        UserDefaults.standard.set(AthYrsOption.text, forKey: "AthYear" + String(opt));
        if AthParticOption != nil {
            UserDefaults.standard.set(AthParticOption.text, forKey: "AthParticipation" + String(opt));
        }

        UserDefaults.standard.set(AthHrsOption.text, forKey: "AthHrs" + String(opt));

        if AthAchievOption != nil {
            UserDefaults.standard.set(AthAchievOption.text, forKey: "AthAchiev" + String(opt));
        }
        
        performSegue(withIdentifier: "goBackToAthHome", sender: self)

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
