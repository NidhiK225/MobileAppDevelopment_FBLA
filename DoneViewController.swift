//
//  DoneViewController.swift
//  iPortfolio
//
//  Created by Nidhi Krishna on 3/10/24.
//

import UIKit

class DoneViewController: UIViewController {
    
    @IBOutlet weak var nameInput: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    


    @IBAction func doneClicked(_ sender: Any) {
            
        portfolioKey = "Portfolio" + String(portfolioCount);
        UserDefaults.standard.set(nameInput.text, forKey: portfolioKey);
        portfolioCount += 1;
        
        performSegue(withIdentifier: "goBackFinal", sender: self);
        
            
  
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
