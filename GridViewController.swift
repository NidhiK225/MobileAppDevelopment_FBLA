//
//  GridViewController.swift
//  MobileAppDev3
//
//  Created by Nidhi Krishna on 2/4/24.
//

import UIKit

class GridViewController: UIViewController {
    
    @IBOutlet weak var Ed: UIButton!
    @IBOutlet weak var Transcript: UIButton!
    @IBOutlet weak var Ath: UIButton!
    @IBOutlet weak var PA: UIButton!
    @IBOutlet weak var CS: UIButton!
    @IBOutlet weak var CO: UIButton!
    @IBOutlet weak var Work: UIButton!
    @IBOutlet weak var Awards: UIButton!








    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = "Portfolio";
    }
    
    @IBAction func unwindToGridHome(_ sender: UIStoryboardSegue)
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
