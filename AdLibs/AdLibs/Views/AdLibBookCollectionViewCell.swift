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
    
    var adlib: AdLib? {
        didSet {
            updateViews()
        }
    }
    
    @IBOutlet weak var adLibStoryTitleLabel: UILabel!
    
    func updateViews() {
        guard let adlib = adlib else { return }
        adLibStoryTitleLabel.text = adlib.title
    }
}
