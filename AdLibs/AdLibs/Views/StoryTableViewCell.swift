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
            setTheme()
        }
    }
    
    @IBOutlet weak var adLibStoryTitleLabel: UILabel!
    
    func updateViews() {
        guard let storyBody = storyBody else { return }
        adLibStoryTitleLabel.text = storyBody.title
    }
    
    func setTheme() {
        switch Settings.shared.changeBackground {
        case 0:
            backgroundColor = .blue
        case 1:
            backgroundColor = UIColor(red: 129/255, green: 194/255, blue: 183/255, alpha: 1.0)
        case 2:
            backgroundColor = .darkGray
        case 3:
            backgroundColor = .systemGray3
        case 4:
            backgroundColor = .systemGreen
        case 5:
            backgroundColor = .lightGray
        case 6:
            backgroundColor = .systemOrange
        case 7:
            backgroundColor = .systemPurple
        case 8:
            backgroundColor = .systemTeal
        case 9:
            backgroundColor = .yellow
        default:
            break
        }
    }
}


