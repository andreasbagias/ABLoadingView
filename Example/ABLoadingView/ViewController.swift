//
//  ViewController.swift
//  ABLoadingView
//
//  Created by andreasbagias on 09/11/2018.
//  Copyright (c) 2018 andreasbagias. All rights reserved.
//

import UIKit
import ABLoadingView

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var titles = ["Full screen - No cancel",
                  "Full screen - Cancel",
                  "Full screen - Percentage and Cancel",
                  "No cancel",
                  "Cancel",
                  "Percentage and Cancel"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.navigationItem.title = "ABLoadingView"
        
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    
    @objc func loadingAction(){
        LoadingView.shared.start()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let index = sender as? Int, let destination = segue.destination as? ImageViewController{
            destination.index = index
        }
        
    }

}

extension ViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.selectionStyle = .none
        
        cell.textLabel?.text = titles[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.performSegue(withIdentifier: "segueID", sender: indexPath.row)
        
    }
    
}

