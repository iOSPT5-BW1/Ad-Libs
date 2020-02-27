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
    @IBOutlet weak var nounTextField: UITextField!
    @IBOutlet weak var verbTextField: UITextField!
    @IBOutlet weak var pronounTextField: UITextField!
    @IBOutlet weak var adjectiveTextField: UITextField!
    @IBOutlet weak var adverbTextField: UITextField!
    @IBOutlet weak var colorTextView: UITextField!
    
    var adLibController: AdLibController?
    var themeHelper: ThemeHelper?
    var adLib: AdLib?
    var storyMode: StoryMode?
    
    var toStoryView = "SegueToStoryView"
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
    }
    
    @IBAction func showStoryTapped(_ sender: UIButton) {
        guard let title = titleTextField.text,
            let noun = nounTextField.text,
            let verb = verbTextField.text,
            let pronoun = pronounTextField.text,
            let adjective = adjectiveTextField.text,
            let adverb = adverbTextField.text,
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
            destination.storyMode = storyMode
        }
    }
    
    


}
