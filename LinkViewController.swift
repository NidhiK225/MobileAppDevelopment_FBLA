//
//  LinkViewController.swift
//  MobileAppDev3
//
//  Created by Nidhi Krishna on 2/4/24.
//

import UIKit
import SafariServices


class LinkViewController: UIViewController {
    
    @IBAction func LinkedIn(_ sender: Any) {
        openURL(url: "https://www.linkedin.com/home")
    }
    
    @IBAction func X(_ sender: Any) {
        openURL(url: "https://twitter.com")
    }
    
    @IBAction func Meta(_ sender: Any) {
        openURL(url: "https://www.facebook.com")
    }
    
    @IBAction func Instagram(_ sender: Any) {
        openURL(url: "https://www.instagram.com/accounts/login/")
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func openURL(url: String) {
        guard let url = URL(string: url) else {return}
        let safariViewController = SFSafariViewController(url: url)
        present(safariViewController, animated: true)
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
