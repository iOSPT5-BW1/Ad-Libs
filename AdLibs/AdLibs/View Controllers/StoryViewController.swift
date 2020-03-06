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
    var adlibFound: StoryBody?
    
    
    @IBOutlet weak var adlibTitleField: UITextField!
    @IBOutlet weak var storyTextVew: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        adlibTitleField.backgroundColor = UIColor(white: 1, alpha: 0.45)
        storyTextVew.backgroundColor = UIColor(white: 1, alpha: 0.75)
        updateViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        setTheme()
    }
    
    func updateViews(){
        guard let adLib = adlibFound else { return }
        if adLib.title != "" {
            adlibTitleField.text = adLib.title
            storyTextVew.text = adLib.filledStory
        } else {
            storyTextVew.text = adLib.filledStory
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
        guard let adlibFound = adlibFound else { return }
        guard let title = adlibTitleField.text,
            let body = storyTextVew.text,
            !title.isEmpty,
            !body.isEmpty else { return }
        if adlibFound == adlibFound || adLib != adLib {
            adLibController?.updateStory(newTitle: title, newBody: body, oldStory: adlibFound)
        } else {
            adLibController?.createStory(title: title, body: body)
        }
        navigationController?.popToRootViewController(animated: true)
    }
}
