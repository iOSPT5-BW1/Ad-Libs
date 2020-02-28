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
    var storyMode: Story?
    
    var toStoryView = "SegueToStoryView"
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
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
        guard let adLibController = adLibController else { return }
        if segue.identifier == toStoryView {
            guard let destination = segue.destination as? StoryViewController else { return }
            destination.adLibController = adLibController
            destination.adLib = adLib
            destination.storyMode = storyMode
            destination.themeHelper = themeHelper
            
        }
    }
    
    


}
