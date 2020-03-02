//
//  ViewController.swift
//  AdLibs
//
//  Created by David Williams on 2/26/20.
//  Copyright © 2020 david williams. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setTheme()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        setTheme()
    }

    func setTheme() {
       // let theme = themeHelper.themePreference
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
//        switch theme {
//        case "Blue":
//            view.backgroundColor = .blue
//        case "Dark":
//            view.backgroundColor = .darkGray
//        case "Green":
//            view.backgroundColor = .systemGreen
//        case "Purple":
//            view.backgroundColor = .systemPurple
//        case "Teal":
//            view.backgroundColor = .systemTeal
//        default:
//            break
//        }
    }
}

extension ViewController: ThemeSelectedDelegate {
    func themeChosen() {
        setTheme()
    }
}
