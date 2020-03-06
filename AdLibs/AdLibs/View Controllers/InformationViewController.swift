//
//  InformationViewController.swift
//  AdLibs
//
//  Created by David Williams on 2/29/20.
//  Copyright © 2020 david williams. All rights reserved.
//

import UIKit

class InformationViewController: UIViewController {

    @IBOutlet weak var infoTextView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        infoTextView.backgroundColor = UIColor(white: 1, alpha: 0.65)
        updateViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setTheme()
    }
    
    func updateViews() {
        infoTextView.text = "\n\n\n\nHello and hey there\n\nThis is an ad-libs app where you can enter words to be inserted into normal conversaational phrases and then get a funny and quirky different result!\n\n\n\n\nYou can go to the Settings section and change the color theme and pick a story to use. If you do not pick a story, one will be chosen for you.\n\n\n\n\nAfter playing Wacky Ad-Libs you can choose to set a title for the generated ad-lib and save it to be viewed at a later time!\n\n\n\n\nEnjoy!"
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
}
