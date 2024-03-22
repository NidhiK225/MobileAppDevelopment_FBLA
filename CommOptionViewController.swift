//
//  CommOptionViewController.swift
//  MobileAppDev3
//
//  Created by Nidhi Krishna on 2/11/24.
//

import UIKit

class CommOptionViewController: UIViewController {
    
    var name = UserDefaults.standard.object(forKey: "Name" + String(opt)) as! String
    var role = UserDefaults.standard.object(forKey: "Role" + String(opt)) as! String
    var participation = UserDefaults.standard.object(forKey: "Participation" + String(opt)) as! String
    var hours = UserDefaults.standard.object(forKey: "Hrs" + String(opt)) as! String
    var achievements = UserDefaults.standard.object(forKey: "Achiev" + String(opt)) as! String
    
    
    @IBOutlet weak var CommunityNameOption: UITextField!
    @IBOutlet weak var CommunityRoleOption: UITextField!
    @IBOutlet weak var CommunityParticOption: UITextView!
    @IBOutlet weak var CommunityHrsOption: UITextField!
    @IBOutlet weak var CommunityAchievOption: UITextView!
    @IBOutlet weak var CommunityPhotoOption: UIImageView!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        CommunityNameOption.text = name
        CommunityRoleOption.text = role
        CommunityParticOption.text = participation
        CommunityHrsOption.text = hours
        CommunityAchievOption.text = achievements

        // Do any additional setup after loading the view.
    }
    
    @IBAction func ifEdited(_ sender: Any) {
        UserDefaults.standard.set(CommunityNameOption.text, forKey: "Name" + String(opt));
        UserDefaults.standard.set(CommunityRoleOption.text, forKey: "Role" + String(opt));
        if CommunityParticOption != nil {
            UserDefaults.standard.set(CommunityAchievOption.text, forKey: "Participation" + String(opt));
        }

        UserDefaults.standard.set(CommunityHrsOption.text, forKey: "Hrs" + String(opt));

        if CommunityAchievOption != nil {
            UserDefaults.standard.set(CommunityAchievOption.text, forKey: "Achiev" + String(opt));
        }
        
        performSegue(withIdentifier: "goBackToCommHome", sender: self)

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
