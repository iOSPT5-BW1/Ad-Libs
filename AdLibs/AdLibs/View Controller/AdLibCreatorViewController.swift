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
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var nounTextField1: UITextField!
    @IBOutlet weak var nounTextField2: UITextField!
    @IBOutlet weak var verbTextField1: UITextField!
    @IBOutlet weak var verbTextField2: UITextField!
    @IBOutlet weak var pronounTextField1: UITextField!
    @IBOutlet weak var pronounTextField2: UITextField!
    @IBOutlet weak var adjectiveTextField1: UITextField!
    @IBOutlet weak var adjectiveTextField2: UITextField!
    @IBOutlet weak var adverbTextField1: UITextField!
    @IBOutlet weak var adverbTextField2: UITextField!
    @IBOutlet weak var colorTextView: UITextField!
    
    var adLibController: AdLibController?
    var themeHelper: ThemeHelper?
    var adLib: AdLib?
    
    var story: Story?
    
    var toStoryView = "SegueToStoryView"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
    }
    func updateViews() {
        
    }
    func storySelector(adLib: AdLib) {
    
        var adLib = adLib
    
        let story1 = "Allison takes her two \(adLib.noun)s for \(adLib.verb) around the \(adLib.noun). They are large \(adLib.noun)s. She is a petite girl.  She is thrown about but still manages to keep them under control.\nShe sees her friend Billy across the street, \(adLib.verb)ing his three \(adLib.noun)s.  They are not large like hers.  They are \(adLib.adjective) but they have loud \(adLib.noun)s.\nThey pass each other and wave hello and go on their separate ways."
        let story2 =  "You find yourself suddenly in the middle of an orchard of lemon trees.  \"Lemon trees?\" you ask yourself. \"What am I doing here?\"  It doesn’t matter. You are here. Let’s deal with it.\nThe smell of lemons permeates the air. You are tempted to walk over to the nearest tree and pick a lemon. And walk over you do. You reach for a lemon on a low hanging branch. You are pricked by a thorn. Lesson learned.  If you want a lemon, it’s safer from the grocer."
        let story3 = "My house is not a large house. Neither is it a small house. My house is a comfortable house to me to live in. My house is blue with turquoise trim and is only a single story house.\nI have a fairly large backyard to play in and it is right behind a creek. I lose many balls into the creek and have to go and find them.  My dog tries to help me do so. He does not help very well. He gets distracted by noises and I have to find him more often than my balls."
        
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
        guard let title = titleTextField.text,
            let noun = nounTextField1.text,
            let verb = verbTextField1.text,
            let pronoun = pronounTextField1.text,
            let adjective = adjectiveTextField1.text,
            let adverb = adverbTextField1.text,
            let color = colorTextView.text,
            !title.isEmpty,
            !noun.isEmpty,
            !verb.isEmpty,
            !pronoun.isEmpty,
            !adjective.isEmpty,
            !adverb.isEmpty,
            !color.isEmpty else { return }
        guard let adLibController = adLibController else { return }
        adLibController.createAdLib(title: title, noun: noun, pronoun: pronoun, verb: verb, adjective: adjective, adverb: adverb, color: color)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == toStoryView {
            let destination = segue.destination as! StoryViewController
            destination.adLibController = adLibController
            destination.adLib = adLib
            destination.story = story
            
        }
    }
    
    
}





