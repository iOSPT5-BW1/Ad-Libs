//
//  AdLibBookCollectionViewCell.swift
//  AdLibs
//
//  Created by David Williams on 2/27/20.
//  Copyright © 2020 david williams. All rights reserved.
//

import UIKit

class AdLibBookCollectionViewCell: UICollectionViewCell {
    
    var adLibController = AdLibController()
    
    var storyBody: StoryBody? {
        didSet {
            updateViews()
        }
    }
    
    @IBOutlet weak var adLibStoryTitleLabel: UILabel!
    
    func updateViews() {
        guard let title = storyBody else { return }
        adLibStoryTitleLabel.text = title.title
    }
}
