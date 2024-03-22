//
//  PAViewController.swift
//  MobileAppDev3
//
//  Created by Nidhi Krishna on 1/31/24.
//

import UIKit
public var started = false;
public var opt = 0;

class PAViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = "Performing Arts"
        
        if PACount > 0 {
            print("YES");
            tableView.isHidden = false;
            makingData()
            
        } else {
            PACount = 0;
            tableView.isHidden = true;
        }


        tableView.delegate = self
        tableView.dataSource = self
        
        title = "Performing Arts";

    }
    
    var data: [String] = []
    
  //  var type = UserDefaults.standard.object(forKey: "PAType0") as! String
  //  var desc = UserDefaults.standard.object(forKey: "PADesc0") as! String
  //  var role = UserDefaults.standard.object(forKey: "PARole0") as! String
  //  var hours = UserDefaults.standard.object(forKey: "PAHrs0") as! String
   // var achievements = UserDefaults.standard.object(forKey: "PAAchiev0") as! String


    func makingData() {
        data = []
        for i in 0 ... PACount - 1 {

            let a_string = String(i)
            let keyName = "PAType" + a_string
            //print(UserDefaults.standard.object(forKey: keyName) as? String)
            let input = UserDefaults.standard.object(forKey: keyName) as! String
            print(keyName)
            print(input)
            data.append(input)
        }
    }



    //var data = [UserDefaults.standard.object(forKey: "Name0") as! String]



    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data.count

    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "PATableCell")
        if let cell = tableView.dequeueReusableCell(withIdentifier: "PATableCell") {
            cell.textLabel?.text = data[indexPath.row]
            return cell
            }

        return UITableViewCell()

    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let destination = storyboard.instantiateViewController(withIdentifier: "PAOptionViewController") as! PAOptionViewController

        for i in 0 ... data.count - 1{
            if data[i] == data[indexPath.row] {
                opt = i
            }
        }

        navigationController?.pushViewController(destination, animated: true)
    }
    
    
    @IBAction func unwindToPAHome(_ sender: UIStoryboardSegue)
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
   
