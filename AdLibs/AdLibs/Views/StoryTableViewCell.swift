//
//  StoryTableViewCell.swift
//  AdLibs
//
//  Created by Marc Jacques on 3/5/20.
//  Copyright © 2020 david williams. All rights reserved.
//

import UIKit

class StoryTableViewCell: UITableViewCell {
    
    var adLibController = AdLibController()
    
    var storyBody: StoryBody? {
        didSet {
            updateViews()
        }
    }
    
    @IBOutlet weak var adLibStoryTitleLabel: UILabel!

    func updateViews() {
        guard let storyBody = storyBody else { return }
            adLibStoryTitleLabel.text = storyBody.title
        }
    }


