//
//  AwardsHomeViewController.swift
//  MobileAppDev3
//
//  Created by Nidhi Krishna on 1/10/24.
//

import UIKit

class AwardsHomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        
        if AwardsCount > 0 {
            print("YES");
            tableView.isHidden = false;
            makingData()
            
        } else {
            AwardsCount = 0;
            tableView.isHidden = true;
        }


        tableView.delegate = self
        tableView.dataSource = self
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = "Awards"
        
    }
    
    var data: [String] = []

    func makingData() {
        data = []
        for i in 0 ... AwardsCount - 1 {

            let a_string = String(i)
            let keyName = "AwardsName" + a_string
            //print(UserDefaults.standard.object(forKey: keyName) as? String)
            let input = UserDefaults.standard.object(forKey: keyName) as! String
            print(keyName)
            print(input)
            data.append(input)
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data.count

    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "AwardsTableCell")
        if let cell = tableView.dequeueReusableCell(withIdentifier: "AwardsTableCell") {
            cell.textLabel?.text = data[indexPath.row]
            return cell
            }

        return UITableViewCell()

    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let destination = storyboard.instantiateViewController(withIdentifier: "AwardsOptionViewController") as! AwardsOptionViewController

        for i in 0 ... data.count - 1{
            if data[i] == data[indexPath.row] {
                opt = i
            }
        }

        navigationController?.pushViewController(destination, animated: true)
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
