//
//  WorkExpOptionViewController.swift
//  MobileAppDev3
//
//  Created by Nidhi Krishna on 2/11/24.
//

import UIKit

class WorkExpOptionViewController: UIViewController {
    
    var name = UserDefaults.standard.object(forKey: "WorkCompany" + String(opt)) as! String
    var role = UserDefaults.standard.object(forKey: "WorkRole" + String(opt)) as! String
    var participation = UserDefaults.standard.object(forKey: "WorkParticipation" + String(opt)) as! String
    var hours = UserDefaults.standard.object(forKey: "WorkHrs" + String(opt)) as! String
    var achievements = UserDefaults.standard.object(forKey: "WorkAchiev" + String(opt)) as! String
    
    
    @IBOutlet weak var workNameOption: UITextField!
    @IBOutlet weak var workRoleOption: UITextField!
    @IBOutlet weak var workParticOption: UITextView!
    @IBOutlet weak var workHrsOption: UITextField!
    @IBOutlet weak var workAchievOption: UITextView!
    @IBOutlet weak var workPhotoOption: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        workNameOption.text = name
        workRoleOption.text = role
        workParticOption.text = participation
        workHrsOption.text = hours
        workAchievOption.text = achievements

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func ifEdited(_ sender: Any) {
        UserDefaults.standard.set(workNameOption.text, forKey: "WorkCompany" + String(opt));
        UserDefaults.standard.set(workRoleOption.text, forKey: "WorkRole" + String(opt));
        if workParticOption != nil {
            UserDefaults.standard.set(workAchievOption.text, forKey: "WorkParticipation" + String(opt));
        }

        UserDefaults.standard.set(workHrsOption.text, forKey: "WorkHrs" + String(opt));

        if workAchievOption != nil {
            UserDefaults.standard.set(workAchievOption.text, forKey: "WorkAchiev" + String(opt));
        }
        
        performSegue(withIdentifier: "goBackToWorkHome", sender: self)

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
