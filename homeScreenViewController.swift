//
//  homeScreenViewController.swift
//  MAD4
//
//  Created by Rachel John on 1/29/24.
//

import UIKit
public var portfolioCount = 0;
var portfolioKey: String = "";
var name: String = UserDefaults.standard.object(forKey: "AccountName") as! String;
public var update = false;

class homeScreenViewController: UIViewController, UITabBarControllerDelegate, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var welcomeName: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    private func tabBarController(tabBarController: UITabBarController, didSelect: homeScreenViewController){
        
    }


    override func viewDidLoad() {
        super.viewDidAppear(true);
        //print(UserDefaults.standard.object(forKey: "AccountName") as? String ?? (Any).self)
        welcomeName.text = "Hello, " + String(name);
        // Do any additional setup after loading the view.
        if portfolioCount > 0 {
            tableView.isHidden = false;
            makingData()
        } else {
            portfolioCount = 0;
            tableView.isHidden = true;
        }
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
    }
    

    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.tabBarController?.delegate = self
        name = UserDefaults.standard.object(forKey: "AccountName") as! String;
        welcomeName.text = "Hello, " + String(name);
        
    }
    
    var data: [String] = []
    
    func makingData() {
        data = []
        for i in 0 ... portfolioCount - 1 {
            let a_string = String(i)
            let keyName = "Portfolio" + a_string
            let input = UserDefaults.standard.object(forKey: keyName) as! String
            data.append(input)
            print(UserDefaults.standard.object(forKey: keyName) as! String)
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "homeTable")
        if let cell = tableView.dequeueReusableCell(withIdentifier: "homeTable") {
            cell.textLabel?.text = data[indexPath.row]
            print(cell)
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let destination = storyboard.instantiateViewController(withIdentifier: "homeViewController") as! AthleticViewController

        for i in 0 ... data.count - 1{
            if data[i] == data[indexPath.row] {
                opt = i
            }
        }

        navigationController?.pushViewController(destination, animated: true)
    }
    
    
    
    @IBAction func unwindToHOMEScreen(_ sender: UIStoryboardSegue)
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
