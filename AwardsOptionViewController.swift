//
//  AwardsOptionViewController.swift
//  MobileAppDev3
//
//  Created by Nidhi Krishna on 2/11/24.
//

import UIKit

class AwardsOptionViewController: UIViewController {
    
    var name = UserDefaults.standard.object(forKey: "AwardsName" + String(opt)) as! String
    var desc = UserDefaults.standard.object(forKey: "AwardsDesc" + String(opt)) as! String
    var date = UserDefaults.standard.object(forKey: "AwardsDate" + String(opt)) as! String    
    
    
    @IBOutlet weak var AwardsNameOption: UITextField!
    @IBOutlet weak var AwardsDescOption: UITextView!
    @IBOutlet weak var AwardsDateOption: UITextField!
    @IBOutlet weak var AwardsPhotoOption: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        AwardsNameOption.text = name
        AwardsDescOption.text = date
        AwardsDateOption.text = desc

        // Do any additional setup after loading the view.
    }
    
    @IBAction func ifEdited(_ sender: Any) {
        UserDefaults.standard.set(AwardsNameOption.text, forKey: "AwardsName" + String(opt));
       
        if AwardsDescOption != nil {
            UserDefaults.standard.set(AwardsDescOption.text, forKey: "AwardsDesc" + String(opt));
        }

        UserDefaults.standard.set(AwardsDateOption.text, forKey: "AwardsDate" + String(opt));
        
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
