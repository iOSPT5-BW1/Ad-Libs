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
    var story: Story?
    var themeHelper: ThemeHelper?
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var storyTextVew: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
     
    }
    
    @IBAction func saveButtonTapped(_ sender: UIButton) {
        guard adLib != nil else { return }
        
    navigationController?.popViewController(animated: true)
    dismiss(animated: true, completion: nil)
    }
    
    func updateViews(){
        guard let adLib = adLib,
            isViewLoaded else { return }
        titleLabel.text = adLib.title
        storyTextVew.text = adLib.story
    }
}
