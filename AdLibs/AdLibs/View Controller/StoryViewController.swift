//
//  StoryViewController.swift
//  AdLibs
//
//  Created by Marc Jacques on 2/26/20.
//  Copyright © 2020 david williams. All rights reserved.
//

import UIKit

class StoryViewController: UIViewController {
// MARK: - Properties and Outlets
    
    var adLibController : AdLibController?
    var adLib: AdLib?
    var storyMode: Story?
    var themeHelper: ThemeHelper?
    var story = String()
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var storyTextVew: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

     
    }
    
    @IBAction func saveButtonTapped(_ sender: UIButton) {
        guard let adLibController = adLibController,
        let adLib = adLib else { return }
        adLibController.updateStory(adLib: adLib, newStory: story)
    }
    


}
