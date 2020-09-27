//
//  EpisodeViewController.swift
//  ApiRickandMorti
//
//  Created by Никита Микрюков on 22.09.2020.
//  Copyright © 2020 Никита Микрюков. All rights reserved.
//
import UIKit

class EpisodeViewController: UICollectionViewController {
    
    private var result: [Result.Episode] = []

    override func viewDidLoad() {
        
        NetworkManager.shared.getResultsEpisode{ results in
            self.result = results
            self.collectionView.reloadData()
        }
    }
    
    // MARK: - Table view data source
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //epsode?.results.count ?? 1
        result.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)as! EpisodeActionCell
        
        let results = result[indexPath.row]
        cell.configure(with: results)
        
        return cell
    }
    
}



