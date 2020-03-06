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
    var storyFound: Story?
    var storyState: StoryState?
    
    @IBOutlet weak var storyTitleField: UITextField!
    @IBOutlet weak var storyTextVew: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        storyTitleField.backgroundColor = UIColor(white: 1, alpha: 0.45)
        storyTextVew.backgroundColor = UIColor(white: 1, alpha: 0.75)
        updateViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        setTheme()
    }
    
    func updateViews(){
        guard let storyFound = storyFound else { return }
        if storyFound.title != "" {
            storyTitleField.text = storyFound.title
            storyTextVew.text = storyFound.body
        } else {
            storyTextVew.text = storyFound.body
            setTheme()
        }
    }
    
    func setTheme() {
        switch Settings.shared.changeBackground {
        case 0:
            view.backgroundColor = .blue
        case 1:
            view.backgroundColor = UIColor(red: 129/255, green: 194/255, blue: 183/255, alpha: 1.0)
        case 2:
            view.backgroundColor = .darkGray
        case 3:
            view.backgroundColor = .systemGray3
        case 4:
            view.backgroundColor = .systemGreen
        case 5:
            view.backgroundColor = .lightGray
        case 6:
            view.backgroundColor = .systemOrange
        case 7:
            view.backgroundColor = .systemPurple
        case 8:
            view.backgroundColor = .systemTeal
        case 9:
            view.backgroundColor = .yellow
        default:
            break
        }
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let storyState = storyState,
            let storyFound = storyFound,
            let title = storyTitleField.text,
            let body = storyTextVew.text,
            !title.isEmpty,
            !body.isEmpty else { return }
        if storyState == .newStory {
            adLibController?.createStory(title: title, body: body)
            navigationController?.popToRootViewController(animated: true)
        } else {
            adLibController?.updateStory(newTitle: title, newBody: body, oldStory: storyFound)
            navigationController?.popViewController(animated: true)
        }
    }
}
