//
//  AdLibCreatorViewController.swift
//  AdLibs
//
//  Created by Marc Jacques on 2/26/20.
//  Copyright © 2020 david williams. All rights reserved.
//

import UIKit

class AdLibCreatorViewController: UIViewController {
    
    //    MARK: - Properties and Outlets
    
    @IBOutlet weak var nounTextField: UITextField!
    @IBOutlet weak var verbTextField: UITextField!
    @IBOutlet weak var pronounTextField: UITextField!
    @IBOutlet weak var adjectiveTextField: UITextField!
    @IBOutlet weak var adverbTextField: UITextField!
    @IBOutlet weak var colorTextView: UITextField!
    
    var adLibController: AdLibController?
    
    var adLib: AdLib?
    var story: Story?
    
    var toStoryView = "SegueToStoryView"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nounTextField.backgroundColor = UIColor(white: 1, alpha: 0.75)
        verbTextField.backgroundColor = UIColor(white: 1, alpha: 0.75)
        pronounTextField.backgroundColor = UIColor(white: 1, alpha: 0.75)
        adjectiveTextField.backgroundColor = UIColor(white: 1, alpha: 0.75)
        adverbTextField.backgroundColor = UIColor(white: 1, alpha: 0.75)
        colorTextView.backgroundColor = UIColor(white: 1, alpha: 0.75)
        updateViews()
    }
    
    func updateViews() {
        setTheme()
    }
    
    func storySelector(adLib: AdLib) {
        
        var adLib = adLib
        
        let story1 = "   Allison takes her two \(adLib.noun)s for \(adLib.verb) around the block. They are large \(adLib.noun)s. She is a petite girl.  She is thrown about but still manages to keep them under control.\n   She sees her friend Billy across the street, \(adLib.verb)ing his three \(adLib.noun)s.  They are not large like hers.  They are \(adLib.adjective) but they have loud \(adLib.noun)s.\n   They \(adLib.adverb) pass each other and wave hello and go on their separate ways."
        let story2 =  "   You find yourself suddenly in the middle of an orchard of lemon \(adLib.noun)s.  \"Lemon \(adLib.noun)s?\" you ask yourself. \"What am I doing here?\"  It doesn’t matter. You are here. Let’s \(adLib.verb) with it.\nThe \(adLib.adjective) of lemons permeates the air. You are tempted to walk over to the nearest tree and pick a lemon. And walk over \(adLib.pronoun) do. You reach for a lemon on a low hanging branch. You are pricked by a thorn. Lesson learned.  If you want a lemon, it’s safer from the grocer."
        let story3 = "   I am still \(adLib.verb)ing how to code in Swift. A programming \(adLib.noun) used in iOS and tvOS apps by Apple. There is a lot to learn and understand. Even though it is suppose to be an \(adLib.adjective) language to \(adLib.verb) it can be daunting, but satisfying. There are times when \(adLib.verb)ing to code you can see \(adLib.color) in frustration.\n   To see your results come alive even on a simulator after a challenging process of \(adLib.adverb) working through a problem can be very exciting. The possibilities are far reaching and within \(adLib.pronoun) grasp!"
       // let story3 = "   My house is not a large house. Neither is it a small house. My house is a comfortable house to me to live in. My house is blue with turquoise trim and is only a single story house.\nI have a fairly large backyard to play in and it is right behind a creek. I lose many balls into the creek and have to go and find them.  My dog tries to help me do so. He does not help very well. He gets distracted by noises and I have to find him more often than my balls."
        
        switch story {
        case .story1:
            adLib.story = story1
            adLibController?.updateStory(adLib: adLib, newStory: adLib.story)
        case .story2:
            adLib.story = story2
            adLibController?.updateStory(adLib: adLib, newStory: adLib.story)
        case .story3:
            adLib.story = story3
            adLibController?.updateStory(adLib: adLib, newStory: adLib.story)
        case .none:
            adLib.story = story1
            adLibController?.updateStory(adLib: adLib, newStory: adLib.story)
        }
    }
    
    @IBAction func showStoryTapped(_ sender: UIButton) {
        guard let noun = nounTextField.text,
            let verb = verbTextField.text,
            let pronoun = pronounTextField.text,
            let adjective = adjectiveTextField.text,
            let adverb = adverbTextField.text,
            let color = colorTextView.text,
            !noun.isEmpty,
            !verb.isEmpty,
            !pronoun.isEmpty,
            !adjective.isEmpty,
            !adverb.isEmpty,
            !color.isEmpty else { return }
        guard let adLibController = adLibController else { return }
        adLibController.createAdLibBody(noun: noun, pronoun: pronoun, verb: verb, adjective: adjective, adverb: adverb, color: color)
        storySelector(adLib: adLib!)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == toStoryView {
            let destination = segue.destination as! StoryViewController
            destination.adLibController = adLibController
            destination.adLib = adLibController?.adLibs[0]
            destination.story = story
        }
    }
    
    func setTheme() {
        switch Settings.shared.changeBackground {
        case 0:
            view.backgroundColor = .blue
        case 1:
            view.backgroundColor = .darkGray
        case 2:
            //view.backgroundColor = .systemGreen
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





