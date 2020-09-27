//
//  EpisodeActionCell.swift
//  ApiRickandMorti
//
//  Created by Никита Микрюков on 22.09.2020.
//  Copyright © 2020 Никита Микрюков. All rights reserved.
//

import UIKit

class EpisodeActionCell: UICollectionViewCell {
    
    @IBOutlet var nameActionLabel: UILabel!
    @IBOutlet var numberEpisode: UILabel!
    @IBOutlet var nameEpisode: UILabel!
    
    
    func configure(with result: Result.Episode?) {
        
        nameActionLabel.text = result?.name
        numberEpisode.text = result?.episode
        nameEpisode.text = result?.air_date
        
    }
    
}
