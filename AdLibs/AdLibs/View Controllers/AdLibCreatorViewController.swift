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
    @IBOutlet weak var switchLabel: UISwitch!
    @IBOutlet weak var randomAdlibLabel: UILabel!
    
    var adLibController: AdLibController?
    
    var adLib: AdLib?
    var words: Words?
    var story: Story?
    var body: StoryBody?
    var storySelected = ""
   
    var toStoryView = "SegueToStoryView"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nounTextField.backgroundColor = UIColor(white: 1, alpha: 0.75)
        verbTextField.backgroundColor = UIColor(white: 1, alpha: 0.75)
        pronounTextField.backgroundColor = UIColor(white: 1, alpha: 0.75)
        adjectiveTextField.backgroundColor = UIColor(white: 1, alpha: 0.75)
        adverbTextField.backgroundColor = UIColor(white: 1, alpha: 0.75)
        colorTextView.backgroundColor = UIColor(white: 1, alpha: 0.75)
        randomAdlibLabel.isHidden = true
        switchLabel.isHidden = true
        
        updateViews()
    }
    
    func updateViews() {
        setTheme()
    }
    
    func storySelector(adLib: Words) ->  String {
    
        let adLib = adLib
        
        let story1 = "   Allison takes her two \(adLib.noun)s for \(adLib.verb) around the block. They are large \(adLib.noun)s. She is a petite girl.  She is thrown about but still manages to keep them under control.\n   She sees her friend Billy across the street, \(adLib.verb)ing his three \(adLib.noun)s.  They are not large like hers.  They are \(adLib.adjective) but they have loud \(adLib.noun)s.\n   They \(adLib.adverb) pass each other and wave hello and go on their separate ways."
        let story2 =  "   You find yourself suddenly in the middle of an orchard of lemon \(adLib.noun)s.  \"Lemon \(adLib.noun)s?\" you ask yourself. \"What am I doing here?\"  It doesn’t matter. You are here. Let’s \(adLib.verb) with it.\n   The \(adLib.adjective) of lemons permeates the air. You are tempted to walk over to the nearest tree and pick a lemon. And walk over \(adLib.pronoun) do. You reach for a lemon on a low hanging branch. You are pricked by a thorn. Lesson learned.  If you want a lemon, it’s safer from the grocer."
        let story3 = "   I am still \(adLib.verb)ing how to code in Swift. A programming \(adLib.noun) used in iOS and tvOS apps by Apple. There is a lot to learn and understand. Even though it is suppose to be an \(adLib.adjective) language to \(adLib.verb) it can be daunting, but satisfying. There are times when \(adLib.verb)ing to code you can see \(adLib.color) in frustration.\n   To see your results come alive even on a simulator after a challenging process of \(adLib.adverb) working through a problem can be very exciting. The possibilities are far reaching and within \(adLib.pronoun) grasp!"
        
        switch Settings.shared.story {
        case .story1:
            storySelected = story1
        case .story2:
            storySelected = story2
        case .story3:
            storySelected = story3
        }
  
  return storySelected
    }
        
    private func setBody() {
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
        words =  adLibController.createAdLibBody(noun: noun, pronoun: pronoun, verb: verb, adjective: adjective, adverb: adverb, color: color, story: Settings.shared.story.rawValue)
        guard let words = words else { return }
        
        let storyString = "\n\n\n\n\n" + storySelector(adLib: words)
        let story = StoryBody(filledStory: storyString)
        self.body = story
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == toStoryView {
            let destination = segue.destination as! StoryViewController
            setBody()
            destination.adLibController = adLibController
            destination.adlibFound = self.body
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
    
    @IBAction func gameSelectSwitched(_ sender: Any) {
    }
}





