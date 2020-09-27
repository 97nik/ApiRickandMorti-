//
//  CourseCell..swift
//  ApiRickandMorti
//
//  Created by Никита Микрюков on 22.09.2020.
//  Copyright © 2020 Никита Микрюков. All rights reserved.
//

import UIKit

class CharacterViewCell: UITableViewCell {
    
    @IBOutlet var courseImage: UIImageView!
    @IBOutlet var courseNameLabel: UILabel!
    @IBOutlet var numberOfLessons: UILabel!
    @IBOutlet var numberOfTests: UILabel!
    
    func configure(with result: Result?) {
        
        courseNameLabel.text = result?.name
        numberOfLessons.text = result?.gender
        numberOfTests.text = result?.species
        
        DispatchQueue.global().async {
            guard let stringUrl = result?.image else { return }
            guard let imageUrl = URL(string: stringUrl) else { return }
            guard let imageData = try? Data(contentsOf: imageUrl) else { return }
            DispatchQueue.main.async {
                self.courseImage.image = UIImage(data: imageData)
            }
        }
    }
}
