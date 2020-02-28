//
//  ViewController.swift
//  AdLibs
//
//  Created by David Williams on 2/26/20.
//  Copyright © 2020 david williams. All rights reserved.
//

import UIKit

class AdLibsViewController: UIViewController {

    var themeHelper = ThemeHelper()
    var adLibController = AdLibController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setTheme()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "StartAdLibSegue" {
            let adLibVC = segue.destination as! AdLibCreatorViewController
            adLibVC.adLibController = adLibController
        }
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

extension AdLibsViewController: ThemeSelectedDelegate {
    func themeChosen() {
        setTheme()
    }
}
