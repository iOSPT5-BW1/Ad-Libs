//
//  ViewController.swift
//  AdLibs
//
//  Created by David Williams on 2/26/20.
//  Copyright © 2020 david williams. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var themeHelper = ThemeHelper()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setTheme()
    }

    func setTheme() {
        let theme = themeHelper.themePreference
        switch theme {
        case "Blue":
            view.backgroundColor = .blue
        case "Dark":
            view.backgroundColor = .darkGray
        case "Green":
            view.backgroundColor = .systemGreen
        case "Purple":
            view.backgroundColor = .systemPurple
        case "Teal":
            view.backgroundColor = .systemTeal
        default:
            break
        }
    }
}

extension ViewController: ThemeSelectedDelegate {
    func themeChosen() {
        setTheme()
    }
}
