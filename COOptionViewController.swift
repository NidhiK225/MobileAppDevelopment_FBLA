//
//  COOptionViewController.swift
//  MobileAppDev3
//
//  Created by Nidhi Krishna on 2/11/24.
//

import UIKit

class COOptionViewController: UIViewController {
    
    var name = UserDefaults.standard.object(forKey: "COName" + String(opt)) as! String
    var role = UserDefaults.standard.object(forKey: "CORole" + String(opt)) as! String
    var participation = UserDefaults.standard.object(forKey: "COParticipation" + String(opt)) as! String
    var hours = UserDefaults.standard.object(forKey: "COHrs" + String(opt)) as! String
    var achievements = UserDefaults.standard.object(forKey: "COAchiev" + String(opt)) as! String
    
    
    @IBOutlet weak var CONameOption: UITextField!
    @IBOutlet weak var CORoleOption: UITextField!
    @IBOutlet weak var COParticOption: UITextView!
    @IBOutlet weak var COHrsOption: UITextField!
    @IBOutlet weak var COAchievOption: UITextView!
    @IBOutlet weak var COPhotoOption: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        CONameOption.text = name
        CORoleOption.text = role
        COParticOption.text = participation
        COHrsOption.text = hours
        COAchievOption.text = achievements
        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func ifEdited(_ sender: Any) {
        UserDefaults.standard.set(CONameOption.text, forKey: "COName" + String(opt));
        UserDefaults.standard.set(CORoleOption.text, forKey: "CORole" + String(opt));
        if COParticOption != nil {
            UserDefaults.standard.set(COAchievOption.text, forKey: "COParticipation" + String(opt));
        }

        UserDefaults.standard.set(COHrsOption.text, forKey: "COHrs" + String(opt));

        if COAchievOption != nil {
            UserDefaults.standard.set(COAchievOption.text, forKey: "COAchiev" + String(opt));
        }
        
        performSegue(withIdentifier: "goBackToCOHome", sender: self)

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
