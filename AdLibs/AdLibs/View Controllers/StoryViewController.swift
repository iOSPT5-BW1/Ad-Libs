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
    var adlibFound: StoryBody?
   
    @IBOutlet weak var adlibTitleField: UITextField!
    @IBOutlet weak var storyTextVew: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        adlibTitleField.backgroundColor = UIColor(white: 1, alpha: 0.45)
        storyTextVew.backgroundColor = UIColor(white: 1, alpha: 0.75)
        updateViews()
    }
    // need to make a new create func to only save passed adlib and entered title
//    @IBAction func saveButtonTapped(_ sender: UIButton) {
//        guard adLib != nil else { return }
//        adLibController?.createAdLibBody(noun: adLib?.noun, pronoun: <#String#>, verb: <#String#>, adjective: <#String#>, adverb: <#String#>, color: <#String#>, story: <#String#>)
//    navigationController?.popViewController(animated: true)
//    }
    
       override func viewWillAppear(_ animated: Bool) {
              super.viewWillAppear(true)
              setTheme()
          }
    
    func updateViews(){
        guard let adLib = adlibFound else { return }
        storyTextVew.text = adLib.filledStory
        setTheme()
    }
    
    func setTheme() {
        switch Settings.shared.changeBackground {
        case 0:
            view.backgroundColor = .blue
        case 1:
            view.backgroundColor = .darkGray
        case 2:
            view.backgroundColor = UIColor(red: 129/255, green: 194/255, blue: 183/255, alpha: 1.0)
        case 3:
            view.backgroundColor = .systemPurple
        case 4:
            view.backgroundColor = .systemTeal
        default:
            break
        }
    }
}
