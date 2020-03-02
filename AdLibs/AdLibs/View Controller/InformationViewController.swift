//
//  InformationViewController.swift
//  AdLibs
//
//  Created by David Williams on 2/29/20.
//  Copyright © 2020 david williams. All rights reserved.
//

import UIKit

class InformationViewController: UIViewController {

    // var themeHelper: ThemeHelper?
    
    @IBOutlet weak var infoTextView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        infoTextView.backgroundColor = UIColor(white: 1, alpha: 0.75)
        updateViews()
    }
    
    func updateViews() {
        setTheme()
       // infoTextView.text = ""
    }
    
    func setTheme() {
        switch Settings.shared.changeBackground {
        case 0:
            view.backgroundColor = .blue
        case 1:
            view.backgroundColor = .darkGray
        case 2:
            view.backgroundColor = .systemGreen
        case 3:
            view.backgroundColor = .systemPurple
        case 4:
            view.backgroundColor = .systemTeal
        default:
            break
        }
    }
}
