//
//  CoursesViewController.swift
//  ApiRickandMorti
//
//  Created by Никита Микрюков on 22.09.2020.
//  Copyright © 2020 Никита Микрюков. All rights reserved.
//
import UIKit
import Alamofire

class CharacterViewController: UITableViewController {
 
    private var result: [Result] = []
    
    override func viewDidLoad() {
        
        NetworkManager.shared.getResultsCharacter{ results in
            self.result = results
            self.tableView.reloadData()
        }
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        result.count
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CharacterViewCell
        
        let results = result[indexPath.row]
        cell.configure(with: results)
        return cell
    }
    
    
}
